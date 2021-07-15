.section __TEXT, __text,regular,pure_instructions
.global  _sumOf
.p2align 2

// signature: int* sumOf(int n, void(*callback)(int *n))
_sumOf:
	;; prolouge
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]
	add	x29, sp, #32

	str	x0, [sp, #16]	;store n
	str	x1, [sp, #0]	;store callback pointer
	mov	x0, #8		;sizeof(int*)
	bl	_malloc		;call malloc(...)
	str	x0, [sp, #8]	;result pointer

	ldr	x0, [sp, #16]	;load n
	mov	x1, #0 		;sum
	mov	x3, #1		;for loop counter
BRANCH1:
	cmp	x3, x0		;compare i with n
	b.gt	BRANCH2		;branch iff i > n
	add	x1, x1, x3	;add sum
	add	x3, x3, #1	;increment 'for loop' counter
	b	BRANCH1		;branch back

BRANCH2:
	ldr	x4, [sp, #8]	;load addr provided by malloc
	str	x1, [x4]	;store sum
	ldr	x0, [sp, #8]	;load into return register
	ldr	x1, [sp, #0]	;load callback pointer
	cbz	x1, BRANCH3	;branch to BRANCH3 when null
	blr	x1		;branch and link register ( callback ptr )
	ldr	x0, [sp, #8]	;load result ptr

BRANCH3:
	;; epilouge
	ldp	x29, x30, [sp, #32]
	add	sp, sp, #48
	ret
