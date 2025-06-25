; ModuleID = 'test'
  %tape     = alloca [30000 x i8]
  %tape_ptr = alloca i8*
  %ptr0     = getelementptr [30000 x i8], [30000 x i8]* %tape, i32 0, i32 0
  store i8* %ptr0, i8** %tape_ptr        ; init tape pointer
  ; +
  %ptr1 = load i8*, i8** %tape_ptr
  %ptr2 = load i8, i8* %ptr1
  %ptr3 = add i8 %ptr2, 1
  store i8 %ptr3, i8* %ptr1

  ; +
  %ptr4 = load i8*, i8** %tape_ptr
  %ptr5 = load i8, i8* %ptr4
  %ptr6 = add i8 %ptr5, 1
  store i8 %ptr6, i8* %ptr4

  ; +
  %ptr7 = load i8*, i8** %tape_ptr
  %ptr8 = load i8, i8* %ptr7
  %ptr9 = add i8 %ptr8, 1
  store i8 %ptr9, i8* %ptr7

  ; +
  %ptr10 = load i8*, i8** %tape_ptr
  %ptr11 = load i8, i8* %ptr10
  %ptr12 = add i8 %ptr11, 1
  store i8 %ptr12, i8* %ptr10

  ; +
  %ptr13 = load i8*, i8** %tape_ptr
  %ptr14 = load i8, i8* %ptr13
  %ptr15 = add i8 %ptr14, 1
  store i8 %ptr15, i8* %ptr13

  ; +
  %ptr16 = load i8*, i8** %tape_ptr
  %ptr17 = load i8, i8* %ptr16
  %ptr18 = add i8 %ptr17, 1
  store i8 %ptr18, i8* %ptr16

  ; +
  %ptr19 = load i8*, i8** %tape_ptr
  %ptr20 = load i8, i8* %ptr19
  %ptr21 = add i8 %ptr20, 1
  store i8 %ptr21, i8* %ptr19

  ; +
  %ptr22 = load i8*, i8** %tape_ptr
  %ptr23 = load i8, i8* %ptr22
  %ptr24 = add i8 %ptr23, 1
  store i8 %ptr24, i8* %ptr22

  ; [
  br label %ptr25_start
ptr25_start:
  %ptr26 = load i8*, i8** %tape_ptr
  %ptr27 = load i8, i8* %ptr26
  %ptr28 = icmp eq i8 %ptr27, 0
  br i1 %ptr28, label %ptr25_end, label %ptr25_body
ptr25_body:

  ; >
  %ptr29    = load i8*, i8** %tape_ptr
  %ptr30 = getelementptr i8, i8* %ptr29, i32 1
  store i8* %ptr30, i8** %tape_ptr

  ; +
  %ptr31 = load i8*, i8** %tape_ptr
  %ptr32 = load i8, i8* %ptr31
  %ptr33 = add i8 %ptr32, 1
  store i8 %ptr33, i8* %ptr31

  ; +
  %ptr34 = load i8*, i8** %tape_ptr
  %ptr35 = load i8, i8* %ptr34
  %ptr36 = add i8 %ptr35, 1
  store i8 %ptr36, i8* %ptr34

  ; +
  %ptr37 = load i8*, i8** %tape_ptr
  %ptr38 = load i8, i8* %ptr37
  %ptr39 = add i8 %ptr38, 1
  store i8 %ptr39, i8* %ptr37

  ; +
  %ptr40 = load i8*, i8** %tape_ptr
  %ptr41 = load i8, i8* %ptr40
  %ptr42 = add i8 %ptr41, 1
  store i8 %ptr42, i8* %ptr40

  ; [
  br label %ptr43_start
ptr43_start:
  %ptr44 = load i8*, i8** %tape_ptr
  %ptr45 = load i8, i8* %ptr44
  %ptr46 = icmp eq i8 %ptr45, 0
  br i1 %ptr46, label %ptr43_end, label %ptr43_body
ptr43_body:

  ; >
  %ptr47    = load i8*, i8** %tape_ptr
  %ptr48 = getelementptr i8, i8* %ptr47, i32 1
  store i8* %ptr48, i8** %tape_ptr

  ; +
  %ptr49 = load i8*, i8** %tape_ptr
  %ptr50 = load i8, i8* %ptr49
  %ptr51 = add i8 %ptr50, 1
  store i8 %ptr51, i8* %ptr49

  ; +
  %ptr52 = load i8*, i8** %tape_ptr
  %ptr53 = load i8, i8* %ptr52
  %ptr54 = add i8 %ptr53, 1
  store i8 %ptr54, i8* %ptr52

  ; >
  %ptr55    = load i8*, i8** %tape_ptr
  %ptr56 = getelementptr i8, i8* %ptr55, i32 1
  store i8* %ptr56, i8** %tape_ptr

  ; +
  %ptr57 = load i8*, i8** %tape_ptr
  %ptr58 = load i8, i8* %ptr57
  %ptr59 = add i8 %ptr58, 1
  store i8 %ptr59, i8* %ptr57

  ; +
  %ptr60 = load i8*, i8** %tape_ptr
  %ptr61 = load i8, i8* %ptr60
  %ptr62 = add i8 %ptr61, 1
  store i8 %ptr62, i8* %ptr60

  ; +
  %ptr63 = load i8*, i8** %tape_ptr
  %ptr64 = load i8, i8* %ptr63
  %ptr65 = add i8 %ptr64, 1
  store i8 %ptr65, i8* %ptr63

  ; >
  %ptr66    = load i8*, i8** %tape_ptr
  %ptr67 = getelementptr i8, i8* %ptr66, i32 1
  store i8* %ptr67, i8** %tape_ptr

  ; +
  %ptr68 = load i8*, i8** %tape_ptr
  %ptr69 = load i8, i8* %ptr68
  %ptr70 = add i8 %ptr69, 1
  store i8 %ptr70, i8* %ptr68

  ; +
  %ptr71 = load i8*, i8** %tape_ptr
  %ptr72 = load i8, i8* %ptr71
  %ptr73 = add i8 %ptr72, 1
  store i8 %ptr73, i8* %ptr71

  ; +
  %ptr74 = load i8*, i8** %tape_ptr
  %ptr75 = load i8, i8* %ptr74
  %ptr76 = add i8 %ptr75, 1
  store i8 %ptr76, i8* %ptr74

  ; >
  %ptr77    = load i8*, i8** %tape_ptr
  %ptr78 = getelementptr i8, i8* %ptr77, i32 1
  store i8* %ptr78, i8** %tape_ptr

  ; +
  %ptr79 = load i8*, i8** %tape_ptr
  %ptr80 = load i8, i8* %ptr79
  %ptr81 = add i8 %ptr80, 1
  store i8 %ptr81, i8* %ptr79

  ; <
  %ptr82    = load i8*, i8** %tape_ptr
  %ptr83 = getelementptr i8, i8* %ptr82, i32 -1
  store i8* %ptr83, i8** %tape_ptr

  ; <
  %ptr84    = load i8*, i8** %tape_ptr
  %ptr85 = getelementptr i8, i8* %ptr84, i32 -1
  store i8* %ptr85, i8** %tape_ptr

  ; <
  %ptr86    = load i8*, i8** %tape_ptr
  %ptr87 = getelementptr i8, i8* %ptr86, i32 -1
  store i8* %ptr87, i8** %tape_ptr

  ; <
  %ptr88    = load i8*, i8** %tape_ptr
  %ptr89 = getelementptr i8, i8* %ptr88, i32 -1
  store i8* %ptr89, i8** %tape_ptr

  ; -
  %ptr90 = load i8*, i8** %tape_ptr
  %ptr91 = load i8, i8* %ptr90
  %ptr92 = sub i8 %ptr91, 1
  store i8 %ptr92, i8* %ptr90

  ; ]
  br label %ptr43_start
ptr43_end:

  ; >
  %ptr93    = load i8*, i8** %tape_ptr
  %ptr94 = getelementptr i8, i8* %ptr93, i32 1
  store i8* %ptr94, i8** %tape_ptr

  ; +
  %ptr95 = load i8*, i8** %tape_ptr
  %ptr96 = load i8, i8* %ptr95
  %ptr97 = add i8 %ptr96, 1
  store i8 %ptr97, i8* %ptr95

  ; >
  %ptr98    = load i8*, i8** %tape_ptr
  %ptr99 = getelementptr i8, i8* %ptr98, i32 1
  store i8* %ptr99, i8** %tape_ptr

  ; +
  %ptr100 = load i8*, i8** %tape_ptr
  %ptr101 = load i8, i8* %ptr100
  %ptr102 = add i8 %ptr101, 1
  store i8 %ptr102, i8* %ptr100

  ; >
  %ptr103    = load i8*, i8** %tape_ptr
  %ptr104 = getelementptr i8, i8* %ptr103, i32 1
  store i8* %ptr104, i8** %tape_ptr

  ; -
  %ptr105 = load i8*, i8** %tape_ptr
  %ptr106 = load i8, i8* %ptr105
  %ptr107 = sub i8 %ptr106, 1
  store i8 %ptr107, i8* %ptr105

  ; >
  %ptr108    = load i8*, i8** %tape_ptr
  %ptr109 = getelementptr i8, i8* %ptr108, i32 1
  store i8* %ptr109, i8** %tape_ptr

  ; >
  %ptr110    = load i8*, i8** %tape_ptr
  %ptr111 = getelementptr i8, i8* %ptr110, i32 1
  store i8* %ptr111, i8** %tape_ptr

  ; +
  %ptr112 = load i8*, i8** %tape_ptr
  %ptr113 = load i8, i8* %ptr112
  %ptr114 = add i8 %ptr113, 1
  store i8 %ptr114, i8* %ptr112

  ; [
  br label %ptr115_start
ptr115_start:
  %ptr116 = load i8*, i8** %tape_ptr
  %ptr117 = load i8, i8* %ptr116
  %ptr118 = icmp eq i8 %ptr117, 0
  br i1 %ptr118, label %ptr115_end, label %ptr115_body
ptr115_body:

  ; <
  %ptr119    = load i8*, i8** %tape_ptr
  %ptr120 = getelementptr i8, i8* %ptr119, i32 -1
  store i8* %ptr120, i8** %tape_ptr

  ; ]
  br label %ptr115_start
ptr115_end:

  ; <
  %ptr121    = load i8*, i8** %tape_ptr
  %ptr122 = getelementptr i8, i8* %ptr121, i32 -1
  store i8* %ptr122, i8** %tape_ptr

  ; -
  %ptr123 = load i8*, i8** %tape_ptr
  %ptr124 = load i8, i8* %ptr123
  %ptr125 = sub i8 %ptr124, 1
  store i8 %ptr125, i8* %ptr123

  ; ]
  br label %ptr25_start
ptr25_end:

  ; >
  %ptr126    = load i8*, i8** %tape_ptr
  %ptr127 = getelementptr i8, i8* %ptr126, i32 1
  store i8* %ptr127, i8** %tape_ptr

  ; >
  %ptr128    = load i8*, i8** %tape_ptr
  %ptr129 = getelementptr i8, i8* %ptr128, i32 1
  store i8* %ptr129, i8** %tape_ptr

  ; .
  %ptr130 = load i8*, i8** %tape_ptr
  %ptr131 = load i8, i8* %ptr130
  %ptr132 = sext i8 %ptr131 to i32
  call i32 @putchar(i32 %ptr132)

  ; >
  %ptr133    = load i8*, i8** %tape_ptr
  %ptr134 = getelementptr i8, i8* %ptr133, i32 1
  store i8* %ptr134, i8** %tape_ptr

  ; -
  %ptr135 = load i8*, i8** %tape_ptr
  %ptr136 = load i8, i8* %ptr135
  %ptr137 = sub i8 %ptr136, 1
  store i8 %ptr137, i8* %ptr135

  ; -
  %ptr138 = load i8*, i8** %tape_ptr
  %ptr139 = load i8, i8* %ptr138
  %ptr140 = sub i8 %ptr139, 1
  store i8 %ptr140, i8* %ptr138

  ; -
  %ptr141 = load i8*, i8** %tape_ptr
  %ptr142 = load i8, i8* %ptr141
  %ptr143 = sub i8 %ptr142, 1
  store i8 %ptr143, i8* %ptr141

  ; .
  %ptr144 = load i8*, i8** %tape_ptr
  %ptr145 = load i8, i8* %ptr144
  %ptr146 = sext i8 %ptr145 to i32
  call i32 @putchar(i32 %ptr146)

  ; +
  %ptr147 = load i8*, i8** %tape_ptr
  %ptr148 = load i8, i8* %ptr147
  %ptr149 = add i8 %ptr148, 1
  store i8 %ptr149, i8* %ptr147

  ; +
  %ptr150 = load i8*, i8** %tape_ptr
  %ptr151 = load i8, i8* %ptr150
  %ptr152 = add i8 %ptr151, 1
  store i8 %ptr152, i8* %ptr150

  ; +
  %ptr153 = load i8*, i8** %tape_ptr
  %ptr154 = load i8, i8* %ptr153
  %ptr155 = add i8 %ptr154, 1
  store i8 %ptr155, i8* %ptr153

  ; +
  %ptr156 = load i8*, i8** %tape_ptr
  %ptr157 = load i8, i8* %ptr156
  %ptr158 = add i8 %ptr157, 1
  store i8 %ptr158, i8* %ptr156

  ; +
  %ptr159 = load i8*, i8** %tape_ptr
  %ptr160 = load i8, i8* %ptr159
  %ptr161 = add i8 %ptr160, 1
  store i8 %ptr161, i8* %ptr159

  ; +
  %ptr162 = load i8*, i8** %tape_ptr
  %ptr163 = load i8, i8* %ptr162
  %ptr164 = add i8 %ptr163, 1
  store i8 %ptr164, i8* %ptr162

  ; +
  %ptr165 = load i8*, i8** %tape_ptr
  %ptr166 = load i8, i8* %ptr165
  %ptr167 = add i8 %ptr166, 1
  store i8 %ptr167, i8* %ptr165

  ; .
  %ptr168 = load i8*, i8** %tape_ptr
  %ptr169 = load i8, i8* %ptr168
  %ptr170 = sext i8 %ptr169 to i32
  call i32 @putchar(i32 %ptr170)

  ; .
  %ptr171 = load i8*, i8** %tape_ptr
  %ptr172 = load i8, i8* %ptr171
  %ptr173 = sext i8 %ptr172 to i32
  call i32 @putchar(i32 %ptr173)

  ; +
  %ptr174 = load i8*, i8** %tape_ptr
  %ptr175 = load i8, i8* %ptr174
  %ptr176 = add i8 %ptr175, 1
  store i8 %ptr176, i8* %ptr174

  ; +
  %ptr177 = load i8*, i8** %tape_ptr
  %ptr178 = load i8, i8* %ptr177
  %ptr179 = add i8 %ptr178, 1
  store i8 %ptr179, i8* %ptr177

  ; +
  %ptr180 = load i8*, i8** %tape_ptr
  %ptr181 = load i8, i8* %ptr180
  %ptr182 = add i8 %ptr181, 1
  store i8 %ptr182, i8* %ptr180

  ; .
  %ptr183 = load i8*, i8** %tape_ptr
  %ptr184 = load i8, i8* %ptr183
  %ptr185 = sext i8 %ptr184 to i32
  call i32 @putchar(i32 %ptr185)

  ; >
  %ptr186    = load i8*, i8** %tape_ptr
  %ptr187 = getelementptr i8, i8* %ptr186, i32 1
  store i8* %ptr187, i8** %tape_ptr

  ; >
  %ptr188    = load i8*, i8** %tape_ptr
  %ptr189 = getelementptr i8, i8* %ptr188, i32 1
  store i8* %ptr189, i8** %tape_ptr

  ; .
  %ptr190 = load i8*, i8** %tape_ptr
  %ptr191 = load i8, i8* %ptr190
  %ptr192 = sext i8 %ptr191 to i32
  call i32 @putchar(i32 %ptr192)

  ; <
  %ptr193    = load i8*, i8** %tape_ptr
  %ptr194 = getelementptr i8, i8* %ptr193, i32 -1
  store i8* %ptr194, i8** %tape_ptr

  ; -
  %ptr195 = load i8*, i8** %tape_ptr
  %ptr196 = load i8, i8* %ptr195
  %ptr197 = sub i8 %ptr196, 1
  store i8 %ptr197, i8* %ptr195

  ; .
  %ptr198 = load i8*, i8** %tape_ptr
  %ptr199 = load i8, i8* %ptr198
  %ptr200 = sext i8 %ptr199 to i32
  call i32 @putchar(i32 %ptr200)

  ; <
  %ptr201    = load i8*, i8** %tape_ptr
  %ptr202 = getelementptr i8, i8* %ptr201, i32 -1
  store i8* %ptr202, i8** %tape_ptr

  ; .
  %ptr203 = load i8*, i8** %tape_ptr
  %ptr204 = load i8, i8* %ptr203
  %ptr205 = sext i8 %ptr204 to i32
  call i32 @putchar(i32 %ptr205)

  ; +
  %ptr206 = load i8*, i8** %tape_ptr
  %ptr207 = load i8, i8* %ptr206
  %ptr208 = add i8 %ptr207, 1
  store i8 %ptr208, i8* %ptr206

  ; +
  %ptr209 = load i8*, i8** %tape_ptr
  %ptr210 = load i8, i8* %ptr209
  %ptr211 = add i8 %ptr210, 1
  store i8 %ptr211, i8* %ptr209

  ; +
  %ptr212 = load i8*, i8** %tape_ptr
  %ptr213 = load i8, i8* %ptr212
  %ptr214 = add i8 %ptr213, 1
  store i8 %ptr214, i8* %ptr212

  ; .
  %ptr215 = load i8*, i8** %tape_ptr
  %ptr216 = load i8, i8* %ptr215
  %ptr217 = sext i8 %ptr216 to i32
  call i32 @putchar(i32 %ptr217)

  ; -
  %ptr218 = load i8*, i8** %tape_ptr
  %ptr219 = load i8, i8* %ptr218
  %ptr220 = sub i8 %ptr219, 1
  store i8 %ptr220, i8* %ptr218

  ; -
  %ptr221 = load i8*, i8** %tape_ptr
  %ptr222 = load i8, i8* %ptr221
  %ptr223 = sub i8 %ptr222, 1
  store i8 %ptr223, i8* %ptr221

  ; -
  %ptr224 = load i8*, i8** %tape_ptr
  %ptr225 = load i8, i8* %ptr224
  %ptr226 = sub i8 %ptr225, 1
  store i8 %ptr226, i8* %ptr224

  ; -
  %ptr227 = load i8*, i8** %tape_ptr
  %ptr228 = load i8, i8* %ptr227
  %ptr229 = sub i8 %ptr228, 1
  store i8 %ptr229, i8* %ptr227

  ; -
  %ptr230 = load i8*, i8** %tape_ptr
  %ptr231 = load i8, i8* %ptr230
  %ptr232 = sub i8 %ptr231, 1
  store i8 %ptr232, i8* %ptr230

  ; -
  %ptr233 = load i8*, i8** %tape_ptr
  %ptr234 = load i8, i8* %ptr233
  %ptr235 = sub i8 %ptr234, 1
  store i8 %ptr235, i8* %ptr233

  ; .
  %ptr236 = load i8*, i8** %tape_ptr
  %ptr237 = load i8, i8* %ptr236
  %ptr238 = sext i8 %ptr237 to i32
  call i32 @putchar(i32 %ptr238)

  ; -
  %ptr239 = load i8*, i8** %tape_ptr
  %ptr240 = load i8, i8* %ptr239
  %ptr241 = sub i8 %ptr240, 1
  store i8 %ptr241, i8* %ptr239

  ; -
  %ptr242 = load i8*, i8** %tape_ptr
  %ptr243 = load i8, i8* %ptr242
  %ptr244 = sub i8 %ptr243, 1
  store i8 %ptr244, i8* %ptr242

  ; -
  %ptr245 = load i8*, i8** %tape_ptr
  %ptr246 = load i8, i8* %ptr245
  %ptr247 = sub i8 %ptr246, 1
  store i8 %ptr247, i8* %ptr245

  ; -
  %ptr248 = load i8*, i8** %tape_ptr
  %ptr249 = load i8, i8* %ptr248
  %ptr250 = sub i8 %ptr249, 1
  store i8 %ptr250, i8* %ptr248

  ; -
  %ptr251 = load i8*, i8** %tape_ptr
  %ptr252 = load i8, i8* %ptr251
  %ptr253 = sub i8 %ptr252, 1
  store i8 %ptr253, i8* %ptr251

  ; -
  %ptr254 = load i8*, i8** %tape_ptr
  %ptr255 = load i8, i8* %ptr254
  %ptr256 = sub i8 %ptr255, 1
  store i8 %ptr256, i8* %ptr254

  ; -
  %ptr257 = load i8*, i8** %tape_ptr
  %ptr258 = load i8, i8* %ptr257
  %ptr259 = sub i8 %ptr258, 1
  store i8 %ptr259, i8* %ptr257

  ; -
  %ptr260 = load i8*, i8** %tape_ptr
  %ptr261 = load i8, i8* %ptr260
  %ptr262 = sub i8 %ptr261, 1
  store i8 %ptr262, i8* %ptr260

  ; .
  %ptr263 = load i8*, i8** %tape_ptr
  %ptr264 = load i8, i8* %ptr263
  %ptr265 = sext i8 %ptr264 to i32
  call i32 @putchar(i32 %ptr265)

  ; >
  %ptr266    = load i8*, i8** %tape_ptr
  %ptr267 = getelementptr i8, i8* %ptr266, i32 1
  store i8* %ptr267, i8** %tape_ptr

  ; >
  %ptr268    = load i8*, i8** %tape_ptr
  %ptr269 = getelementptr i8, i8* %ptr268, i32 1
  store i8* %ptr269, i8** %tape_ptr

  ; +
  %ptr270 = load i8*, i8** %tape_ptr
  %ptr271 = load i8, i8* %ptr270
  %ptr272 = add i8 %ptr271, 1
  store i8 %ptr272, i8* %ptr270

  ; .
  %ptr273 = load i8*, i8** %tape_ptr
  %ptr274 = load i8, i8* %ptr273
  %ptr275 = sext i8 %ptr274 to i32
  call i32 @putchar(i32 %ptr275)

  ; >
  %ptr276    = load i8*, i8** %tape_ptr
  %ptr277 = getelementptr i8, i8* %ptr276, i32 1
  store i8* %ptr277, i8** %tape_ptr

  ; +
  %ptr278 = load i8*, i8** %tape_ptr
  %ptr279 = load i8, i8* %ptr278
  %ptr280 = add i8 %ptr279, 1
  store i8 %ptr280, i8* %ptr278

  ; +
  %ptr281 = load i8*, i8** %tape_ptr
  %ptr282 = load i8, i8* %ptr281
  %ptr283 = add i8 %ptr282, 1
  store i8 %ptr283, i8* %ptr281

  ; .
  %ptr284 = load i8*, i8** %tape_ptr
  %ptr285 = load i8, i8* %ptr284
  %ptr286 = sext i8 %ptr285 to i32
  call i32 @putchar(i32 %ptr286)

  ret i32 0
}
