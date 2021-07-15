	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	_main
	.p2align 2
_main:

	sub	sp, sp, #32	
	stp	x29, x30, [sp, #16]
	mov	x29, sp
	
	
	mov	w0, #3
	bl	_malloc
	str 	x0, [sp, #12]
	ldr 	x0, [sp, #12]
	
	mov 	w8, #107
	strb 	w8, [x0]
	mov 	w8, #101
	strb 	w8, [x0, #1]
	mov 	w8, #114
	strb 	w8, [x0, #2]
	mov 	w8, #110
	strb 	w8, [x0, #3]	
	mov 	w8, #119
	strb 	w8, [x0, #4]
	mov 	x8, #101
	strb 	w8, [x0, #5]
	mov 	x8, #114
	strb 	w8, [x0, #6]
	mov 	x8, #107
	strb 	w8, [x0, #7]	
	strb	wzr, [x0, #8]
	bl	_puts
	mov	w0, #0
	ldr 	x0, [sp, #12]
	bl 	_free
	
	ldp	x29, x30, [sp, #16]
	add	sp, sp, #32	
	ret	
