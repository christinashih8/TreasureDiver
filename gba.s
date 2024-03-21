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
	.file	"gba.c"
	.text
	.align	2
	.global	drawHorizontalLine
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHorizontalLine, %function
drawHorizontalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, r2
	bxgt	lr
	ldr	ip, .L10
	ldr	ip, [ip]
	rsb	r0, r0, r0, lsl #4
	str	lr, [sp, #-4]!
	add	lr, r1, r0, lsl #4
	add	r0, r2, r0, lsl #4
	add	r1, ip, #2
	add	r2, ip, lr, lsl #1
	add	r1, r1, r0, lsl #1
.L3:
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L3
	ldr	lr, [sp], #4
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.size	drawHorizontalLine, .-drawHorizontalLine
	.align	2
	.global	drawVerticalLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVerticalLine, %function
drawVerticalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, r2
	bxgt	lr
	ldr	ip, .L20
	ldr	ip, [ip]
	rsb	r1, r1, r1, lsl #4
	str	lr, [sp, #-4]!
	rsb	lr, r2, r2, lsl #4
	add	r2, r0, r1, lsl #4
	add	r0, r0, lr, lsl #4
	add	r1, ip, #480
	add	r2, ip, r2, lsl #1
	add	r1, r1, r0, lsl #1
.L14:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L14
	ldr	lr, [sp], #4
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.size	drawVerticalLine, .-drawVerticalLine
	.align	2
	.global	drawRightTriangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRightTriangle, %function
drawRightTriangle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	mov	ip, r0
	push	{r4, r5, r6, lr}
	ldr	lr, .L33
	ldr	r5, [lr]
	rsb	lr, r1, r1, lsl #4
	add	r6, r0, lr, lsl #4
	add	r1, r5, #2
	add	r4, r2, r0
	add	r5, r5, r0, lsl #1
	add	r1, r1, r6, lsl #1
	lsl	lr, lr, #4
.L26:
	cmp	r0, ip
	bgt	.L24
	add	r2, r5, lr, lsl #1
.L25:
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L25
.L24:
	add	ip, ip, #1
	add	r1, r1, #480
	cmp	ip, r4
	add	r1, r1, #2
	add	lr, lr, #240
	bne	.L26
	pop	{r4, r5, r6, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.size	drawRightTriangle, .-drawRightTriangle
	.align	2
	.global	drawRightTriangleMirror
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRightTriangleMirror, %function
drawRightTriangleMirror:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	push	{r4, r5, lr}
	mov	lr, r0
	ldr	ip, .L46
	ldr	ip, [ip]
	rsb	r1, r1, r1, lsl #4
	add	r5, r0, r1, lsl #4
	add	r1, ip, #2
	sub	r4, r0, r2
	add	r1, r1, r5, lsl #1
	add	ip, ip, r5, lsl #1
.L39:
	cmp	lr, r0
	bgt	.L37
	mov	r2, ip
.L38:
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L38
.L37:
	sub	lr, lr, #1
	add	ip, ip, #476
	cmp	lr, r4
	add	ip, ip, #2
	add	r1, r1, #480
	bne	.L39
	pop	{r4, r5, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	.LANCHOR0
	.size	drawRightTriangleMirror, .-drawRightTriangleMirror
	.align	2
	.global	drawRectangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRectangle, %function
drawRectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r3, #0
	bxle	lr
	push	{r4, r5, lr}
	mov	lr, #0
	ldr	r5, .L57
	add	ip, r1, ip
	ldr	r3, [r5]
	rsb	r1, r1, r1, lsl #4
	rsb	ip, ip, ip, lsl #4
	add	r4, r0, r1, lsl #4
	add	ip, r0, ip, lsl #4
	ldr	r1, [r5, #4]
	orr	r0, r2, #-2130706432
	add	r2, r3, ip, lsl #1
	add	r3, r3, r4, lsl #1
.L50:
	add	ip, sp, #12
	str	lr, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r2
	str	r0, [r1, #44]
	bne	.L50
	pop	{r4, r5, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	.LANCHOR0
	.size	drawRectangle, .-drawRectangle
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	ldr	r2, .L61
	sub	sp, sp, #12
	ldm	r2, {r2, r3}
	ldr	r1, .L61+4
	add	ip, sp, #6
	strh	r0, [sp, #6]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L64:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L64
	mov	r2, #67108864
.L65:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L65
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	cmp	ip, r1
	ble	.L73
	add	r1, r1, r3
	cmp	r1, lr
	bgt	.L75
.L73:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L75:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	cmp	r3, r0
	ble	.L73
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.align	2
	.global	drawChar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L86
	push	{r4, r5, lr}
	rsb	r1, r1, r1, lsl #4
	ldr	r4, [ip]
	ldr	lr, .L86+4
	add	r1, r0, r1, lsl #4
	add	r2, r2, r2, lsl #1
	add	r4, r4, r1, lsl #1
	add	lr, lr, r2, lsl #4
	add	r5, r0, #6
.L77:
	mov	r1, r4
	sub	r2, lr, #48
.L79:
	ldrb	ip, [r2]	@ zero_extendqisi2
	add	r2, r2, #6
	cmp	ip, #0
	strhne	r3, [r1]	@ movhi
	cmp	r2, lr
	add	r1, r1, #480
	bne	.L79
	add	r0, r0, #1
	cmp	r0, r5
	add	lr, r2, #1
	add	r4, r4, #2
	bne	.L77
	pop	{r4, r5, lr}
	bx	lr
.L87:
	.align	2
.L86:
	.word	.LANCHOR0
	.word	fontdata+48
	.size	drawChar, .-drawChar
	.align	2
	.global	drawString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString, %function
drawString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L88
	mov	r6, r1
	mov	r4, r0
.L90:
	mov	r0, r4
	mov	r1, r6
	bl	drawChar
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L90
.L88:
	pop	{r4, r5, r6, lr}
	bx	lr
	.size	drawString, .-drawString
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L98
	ldr	lr, [ip, #4]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	lsl	r0, r0, #2
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L99:
	.align	2
.L98:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.global	dma
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 53) 9.1.0"
