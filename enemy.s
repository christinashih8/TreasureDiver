	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"enemy.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"initialized %d sharks\000"
	.text
	.align	2
	.global	initSharks
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSharks, %function
initSharks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	mov	r10, #8
	mov	r6, r5
	ldr	r4, .L6
	ldr	fp, .L6+4
	ldr	r9, .L6+8
	ldr	r8, .L6+12
	ldr	r7, .L6+16
.L2:
	mov	r1, r6
	mov	r3, #4
	str	r5, [r4]
	str	r5, [r4, #8]
	add	r2, r5, #40
	add	r6, r6, #1
	and	ip, r1, #1
	mov	r0, r7
	add	r5, r5, #20
	str	r10, [r4, #16]
	strh	r8, [r4, #24]	@ movhi
	str	r6, [r4, #28]
	str	ip, [r4, #32]
	str	r2, [r4, #4]
	str	r5, [r4, #12]
	str	r3, [r4, #20]
	mov	lr, pc
	bx	r9
	cmp	r6, #5
	str	r4, [fp], #4
	add	r4, r4, #36
	bne	.L2
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	sharkArr
	.word	sharkPointers
	.word	mgba_printf
	.word	19750
	.word	.LC0
	.size	initSharks, .-initSharks
	.align	2
	.global	updateShark
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateShark, %function
updateShark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	r3, .L41
	ldr	r0, [r3]
	ldr	ip, [r4, #4]
	ldr	lr, [r4]
	sub	sp, sp, #20
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, [r4, #20]
	str	lr, [r4, #8]
	str	lr, [sp]
	str	ip, [r4, #12]
	str	ip, [sp, #4]
	ldr	ip, [r4, #16]
	str	r5, [sp, #12]
	str	ip, [sp, #8]
	ldr	r5, .L41+4
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L39
.L9:
	ldr	r2, [r4, #16]
	ldr	r3, [r4]
	rsb	r2, r2, #240
	cmp	r3, r2
	ldr	r2, [r4, #32]
	blt	.L10
	cmp	r2, #0
	bne	.L11
	mov	r2, #1
	cmp	r3, #0
	str	r2, [r4, #32]
	bgt	.L12
.L15:
	mov	r2, #0
	str	r2, [r4, #32]
.L13:
	ldr	r2, [r4, #28]
	add	r3, r2, r3
	str	r3, [r4]
.L40:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L11:
	cmp	r3, #0
	ble	.L18
.L19:
	cmp	r2, #1
	bne	.L8
.L12:
	ldr	r2, [r4, #28]
	sub	r3, r3, r2
	str	r3, [r4]
.L8:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L18:
	cmp	r2, #1
	beq	.L15
	cmp	r2, #0
	beq	.L13
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L10:
	cmp	r3, #0
	ble	.L18
	cmp	r2, #0
	bne	.L19
	ldr	r2, [r4, #28]
	add	r3, r2, r3
	str	r3, [r4]
	b	.L40
.L39:
	ldr	r3, .L41+8
	mov	lr, pc
	bx	r3
	b	.L9
.L42:
	.align	2
.L41:
	.word	player
	.word	collision
	.word	goToLose
	.size	updateShark, .-updateShark
	.align	2
	.global	drawShark
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawShark, %function
drawShark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #1
	bxhi	lr
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	r2, .L49
	sub	sp, sp, #12
	ldr	r3, [r0, #20]
	str	r2, [sp]
	add	r0, r0, #8
	ldm	r0, {r0, r1, r2}
	ldr	r5, .L49+4
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #24]
	ldr	r3, [r4, #20]
	str	r2, [sp]
	ldr	r2, [r4, #16]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	24160
	.word	drawRectangle
	.size	drawShark, .-drawShark
	.align	2
	.global	goTocurrSharkMoveLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	goTocurrSharkMoveLeft, %function
goTocurrSharkMoveLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1
	str	r3, [r0, #32]
	bx	lr
	.size	goTocurrSharkMoveLeft, .-goTocurrSharkMoveLeft
	.align	2
	.global	goTocurrSharkMoveRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	goTocurrSharkMoveRight, %function
goTocurrSharkMoveRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	str	r3, [r0, #32]
	bx	lr
	.size	goTocurrSharkMoveRight, .-goTocurrSharkMoveRight
	.align	2
	.global	currSharkMoveLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	currSharkMoveLeft, %function
currSharkMoveLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	ldr	r2, [r0, #28]
	sub	r3, r3, r2
	str	r3, [r0]
	bx	lr
	.size	currSharkMoveLeft, .-currSharkMoveLeft
	.align	2
	.global	currSharkMoveRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	currSharkMoveRight, %function
currSharkMoveRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	ldr	r2, [r0, #28]
	add	r3, r3, r2
	str	r3, [r0]
	bx	lr
	.size	currSharkMoveRight, .-currSharkMoveRight
	.comm	player,4,4
	.comm	player1,32,4
	.comm	chestPointers,16,4
	.comm	chestArr,160,4
	.comm	sharkPointers,20,4
	.comm	sharkArr,180,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
