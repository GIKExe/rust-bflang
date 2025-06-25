use clap::{ArgAction, Parser};
use colored::Colorize;
use std::{
	fs, io::{self, Read, Write}, path::Path, process::{Command, Stdio}
};

#[derive(Parser)]
#[command(
	name = "bflang",
	version = "1.0",
	about = "Brainfuck LLVM compiler",
	long_about = None
)]
struct Args {
	/// Input Brainfuck file
	file: String,

	/// Output file path
	#[arg(short = 'o', long = "output")]
	output: Option<String>,

	/// Number of memory cells
	#[arg(short = 'c', long = "cells", default_value_t = 30000)]
	cells: usize,

	/// Emit LLVM IR instead of binary
	#[arg(long = "emit-llvm", action = ArgAction::SetTrue)]
	emit_llvm: bool,

	/// Additional flags for Clang
	#[arg(last = true)]
	clang_flags: Vec<String>,
}

struct Counter {
	num: usize,
}

impl Counter {
	pub fn new() -> Self {
		Counter { num: 0 }
	}

	pub fn u(&mut self) -> String {
		self.num += 1;
		format!("ptr{}", self.num)
	}
}

fn main() {
	let args = Args::parse();

	let mut source = Vec::new();
	let filename: &str;
	if args.file == "-" {
		let Ok(_) = io::stdin().lock().read_to_end(&mut source) else {
			println!("!!! Ошибка чтения из STDIN"); return;
		};
		filename = "main";
	} else {
		let Ok(text) = fs::read_to_string(&args.file) else {
			println!("!!! ошибка чтения из файла"); return;
		};
		source = text.as_bytes().to_vec();
		filename = match Path::new(&args.file).file_stem().and_then(|x| x.to_str()) {
			Some(v) => v, None => {println!("!!! нет имени файла"); return;}
		}
	}

	// проверка кода
	let mut depth = 0usize;
	for (i, c) in source.iter().enumerate() {
		if *c == b'[' {
			depth += 1;
		} else if *c == b']' {
			if depth == 0 {
				// типо выводим ошибку?
				let line = source[..i].iter().filter(|&x| *x == b'\n').count() + 1;
				let col = i - match source[..i].iter().rposition(|&x| x == b'\n') {
					Some(v) => v, None => {println!("!!! перенос строки не найден"); return;}
				};
				let lines: Vec<&[u8]> = source.split(|x: &u8| *x == b'\n').collect();
				let snippet = String::from_utf8_lossy(lines[line - 1]);
				let pointer = " ".repeat(col - 1) + "^";
				println!("{}:{line}:{col}: {}: непарный ']'", &args.file, "Ошибка".red());
				println!("{snippet}\n{pointer}");
				return;
			}
			depth -= 1
		}
	}
	if depth > 0 {
		// типо выводим ошибку?
		let Some(i) = source.iter().rposition(|x| *x == b'[') else {
			println!("!!! Перенос строки не найден"); return;
		};

		let line = source[..i].iter().filter(|&x| *x == b'\n').count() + 1;
		let col = i - match source[..i].iter().rposition(|&x| x == b'\n') {
			Some(v) => v, None => {println!("!!! перенос строки не найден"); return;}
		};
		let lines: Vec<&[u8]> = source.split(|x: &u8| *x == b'\n').collect();
		let snippet = String::from_utf8_lossy(lines[line - 1]);
		let pointer = " ".repeat(col - 1) + "^";
		println!("{}:{line}:{col}: {}: непарный '['", &args.file, "Ошибка".red());
		println!("{snippet}\n{pointer}");
		return;
	}

	// далее обработка кода
	const INDENT: &str = "  ";
	let mut counter = Counter::new();
	let mut ir = format!(r#"; ModuleID = '{filename}'
declare i32 @putchar(i32)
declare i32 @getchar()

define i32 @main() {{
{INDENT}%tape     = alloca [{} x i8]
{INDENT}%tape_ptr = alloca i8*
{INDENT}%ptr0     = getelementptr [{} x i8], [{} x i8]* %tape, i32 0, i32 0
{INDENT}store i8* %ptr0, i8** %tape_ptr        ; init tape pointer"#, args.cells, args.cells, args.cells);
	let mut loop_stack: Vec<(String, String)> = Vec::new();
	for c in source {
		match c {
			b'>' | b'<' => {
				let ptr = counter.u();
				let newptr = counter.u();
				let offset = if c == b'>' {"1"} else {"-1"};
				let sym = if c == b'>' {">"} else {"<"};
				ir += &format!("\n{INDENT}; {sym}\n");
				ir += &format!("{INDENT}%{ptr}    = load i8*, i8** %tape_ptr\n");
				ir += &format!("{INDENT}%{newptr} = getelementptr i8, i8* %{ptr}, i32 {offset}\n");
				ir += &format!("{INDENT}store i8* %{newptr}, i8** %tape_ptr\n");
			},
			b'+' | b'-' => {
				let ptr = counter.u();
				let val = counter.u();
				let mod_ = counter.u();
				let op = if c == b'+' {"add"} else {"sub"};
				let sym = if c == b'+' {"+"} else {"-"};
				ir += &format!("\n{INDENT}; {sym}\n");
				ir += &format!("{INDENT}%{ptr} = load i8*, i8** %tape_ptr\n");
				ir += &format!("{INDENT}%{val} = load i8, i8* %{ptr}\n");
				ir += &format!("{INDENT}%{mod_} = {op} i8 %{val}, 1\n");
				ir += &format!("{INDENT}store i8 %{mod_}, i8* %{ptr}\n");
			},
			b'.' => {
				let ptr = counter.u();
				let val = counter.u();
				let ext = counter.u();
				ir += &format!("\n{INDENT}; .\n");
				ir += &format!("{INDENT}%{ptr} = load i8*, i8** %tape_ptr\n");
				ir += &format!("{INDENT}%{val} = load i8, i8* %{ptr}\n");
				ir += &format!("{INDENT}%{ext} = sext i8 %{val} to i32\n");
				ir += &format!("{INDENT}call i32 @putchar(i32 %{ext})\n");
			},
			b',' => {
				let i_ = counter.u();
				let t_ = counter.u();
				let ptr = counter.u();
				ir += &format!("\n{INDENT}; ,\n");
				ir += &format!("{INDENT}%{i_}   = call i32 @getchar()\n");
				ir += &format!("{INDENT}%{t_}   = trunc i32 %{i_} to i8\n");
				ir += &format!("{INDENT}%{ptr} = load i8*, i8** %tape_ptr\n");
				ir += &format!("{INDENT}store i8 %{t_}, i8* %{ptr}\n");
			},
			b'[' => {
				let lid = counter.u();
				let s = format!("{lid}_start");
				let b = format!("{lid}_body");
				let e = format!("{lid}_end");
				loop_stack.push((s.clone(), e.clone()));
				let ptr = counter.u();
				let val = counter.u();
				let cmp = counter.u();
				ir += &format!("\n{INDENT}; [\n");
				ir += &format!("{INDENT}br label %{s}\n");
				ir += &format!("{s}:\n");
				ir += &format!("{INDENT}%{ptr} = load i8*, i8** %tape_ptr\n");
				ir += &format!("{INDENT}%{val} = load i8, i8* %{ptr}\n");
				ir += &format!("{INDENT}%{cmp} = icmp eq i8 %{val}, 0\n");
				ir += &format!("{INDENT}br i1 %{cmp}, label %{e}, label %{b}\n");
				ir += &format!("{b}:\n");
			},
			b']' => {
				let Some((s, e)) = loop_stack.pop() else {
					println!("!!! нет s, e в loop_stack"); return;
				};
				ir += &format!("\n{INDENT}; ]\n");
				ir += &format!("{INDENT}br label %{s}\n");
				ir += &format!("{e}:\n");
			},
			_ => {}
		};
	};

	// ... ?
	ir += &format!("\n{INDENT}ret i32 0\n}}\n");
	if args.emit_llvm {
		if args.output == Some("-".to_owned()) {
			let Ok(_) = io::stdout().lock().write_all(ir.as_bytes()) else {
				println!("!!! Ошибка записи в STDOUT"); return;
			};
		} else {
			let out = args.output.unwrap_or(format!("{filename}.ll"));
			let Ok(_) = fs::write(out, ir.as_bytes()) else {
				println!("!!! Ошибка записи в файл"); return;
			};
		}
	} else {
		let out = args.output.unwrap_or(filename.to_owned());
		let mut cmd = Command::new("clang");
		cmd.args(["-x", "ir", "-", "-o", &out]).stdin(Stdio::piped());
		if !args.clang_flags.is_empty() {
			cmd.args(args.clang_flags);
		}
		println!("{filename}: запуск компиляции...");
		println!("{:?}", cmd);
		let Ok(mut child) = cmd.spawn() else {
			println!("!!! Ошибка запуска процесса"); return;
		};
		if let Some(mut stdin) = child.stdin.take() {
			let Ok(_) = stdin.write_all(ir.as_bytes()) else {
				println!("!!! Ошибка записи данных в STDIN процесса"); return;
			};
		}
		let Ok(status) = child.wait() else {
			println!("!!! Ошибка при получении статуса"); return;
		};
		if !status.success() {
			println!("!!! Компиляция завершилась с ошибкой: {status}");
		}
	}
}
