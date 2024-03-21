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
	.file	"player.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #120
	str	lr, [sp, #-4]!
	mov	r1, #20
	mov	lr, #0
	mov	r2, #4
	mov	ip, #992
	ldr	r3, .L4
	str	r0, [r3]
	str	r0, [r3, #8]
	ldr	r0, .L4+4
	str	lr, [r3, #24]
	strh	ip, [r3, #28]	@ movhi
	str	r3, [r0]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player1
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r0, [r3]
	rsb	r2, r2, #240
	cmp	r0, r2
	str	r0, [r3, #8]
	movge	r0, r2
	strge	r2, [r3]
	cmp	r0, #1
	movle	r2, #1
	strle	r2, [r3]
	ldr	r2, [r3, #20]
	ldr	r1, [r3, #4]
	rsb	r2, r2, #139
	cmp	r1, r2
	str	r1, [r3, #12]
	movge	r1, r2
	strge	r2, [r3, #4]
	cmp	r1, #21
	movle	r2, #21
	strle	r2, [r3, #4]
	ldr	r2, .L15+4
	ldrh	r2, [r2]
	tst	r2, #32
	ldreq	r1, [r3]
	subeq	r1, r1, #1
	streq	r1, [r3]
	tst	r2, #16
	ldreq	r1, [r3]
	addeq	r1, r1, #1
	streq	r1, [r3]
	tst	r2, #128
	ldreq	r1, [r3, #4]
	addeq	r1, r1, #1
	streq	r1, [r3, #4]
	tst	r2, #64
	ldreq	r2, [r3, #4]
	subeq	r2, r2, #1
	streq	r2, [r3, #4]
	bx	lr
.L16:
	.align	2
.L15:
	.word	player
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r5, .L19
	ldr	r0, [r5]
	ldr	ip, .L19+4
	sub	sp, sp, #12
	add	r0, r0, #8
	ldm	r0, {r0, r1, r2, r3}
	ldr	r4, .L19+8
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	ldr	ip, [r5]
	ldm	ip, {r0, r1}
	add	r2, ip, #16
	ldrh	ip, [ip, #28]
	ldm	r2, {r2, r3}
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	player
	.word	24160
	.word	drawRectangle
	.size	drawPlayer, .-drawPlayer
	.comm	chestPointers,16,4
	.comm	chestArr,160,4
	.comm	player,4,4
	.comm	player1,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
