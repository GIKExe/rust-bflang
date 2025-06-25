use clap::{ArgAction, Parser};
use colored::Colorize;
use std::{
	fs,
	io::{self, Read},
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
	if args.file == "-" {
		let Ok(n) = io::stdin().lock().read_to_end(&mut source) else {
			println!("!!! Ошибка чтения из STDIN"); return;
		};
	} else {
		let Ok(text) = fs::read_to_string(&args.file) else {
			println!("!!! ошибка чтения из файла"); return;
		};
		source = text.as_bytes().to_vec();
	}
	// filename

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
	println!("s");
}
