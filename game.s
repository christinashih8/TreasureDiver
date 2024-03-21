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
	.file	"game.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"correctly updated!\000"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L4
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LC0
	.word	mgba_printf
	.size	initGame, .-initGame
	.align	2
	.global	initChests
	.syntax unified
	.arm
	.fpu softvfp
	.type	initChests, %function
initChests:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r2, #10
	mov	ip, #136
	mov	r7, #6
	mov	lr, #4
	mov	r0, #0
	mov	r6, #1
	ldr	r3, .L10
	ldr	r1, .L10+4
	ldr	r5, .L10+8
	ldr	r4, .L10+12
.L7:
	str	r2, [r3]
	str	r2, [r3, #8]
	add	r2, r2, #70
	cmp	r2, r4
	str	ip, [r3, #4]
	str	ip, [r3, #12]
	str	r7, [r3, #16]
	str	lr, [r3, #20]
	strh	r5, [r3, #36]	@ movhi
	str	r0, [r3, #24]
	str	r6, [r3, #28]
	str	r0, [r3, #32]
	str	r3, [r1], #4
	add	r3, r3, #40
	bne	.L7
	ldr	r3, .L10+16
	str	lr, [r3]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	chestArr
	.word	chestPointers
	.word	5460
	.word	290
	.word	chestsRemaining
	.size	initChests, .-initChests
	.align	2
	.global	drawChests
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChests, %function
drawChests:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	r2, .L21
	sub	sp, sp, #12
	ldr	r3, [r0, #20]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r5, .L21+4
	ldm	r0, {r0, r1, r2}
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #36]
	ldr	r3, [r4, #20]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #16]
	mov	lr, pc
	bx	r5
	ldr	r3, .L21+8
	ldr	r1, [r4, #4]
	str	r3, [sp]
	add	r1, r1, #1
	ldr	r2, [r4, #16]
	ldr	r0, [r4]
	mov	r3, #1
	mov	lr, pc
	bx	r5
	mov	r3, #2
	ldm	r4, {r0, r1}
	ldr	ip, .L21+12
	mov	r2, r3
	str	ip, [sp]
	add	r1, r1, #1
	add	r0, r0, r3
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	24160
	.word	drawRectangle
	.word	863
	.word	24311
	.size	drawChests, .-drawChests
	.align	2
	.global	goToChestPickedUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToChestPickedUp, %function
goToChestPickedUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1
	str	r3, [r0, #24]
	bx	lr
	.size	goToChestPickedUp, .-goToChestPickedUp
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"chests remaining %d\000"
	.text
	.align	2
	.global	goToChestRetrieved
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToChestRetrieved, %function
goToChestRetrieved:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	ldr	r3, .L26
	ldr	r1, [r3]
	mov	r4, r0
	sub	sp, sp, #8
	str	r5, [r0, #28]
	sub	r1, r1, #1
	ldr	r2, .L26+4
	ldr	r0, .L26+8
	str	r1, [r3]
	mov	lr, pc
	bx	r2
	mov	r3, #12
	ldr	r0, [r4]
	ldr	ip, .L26+12
	mov	r2, r3
	ldr	r1, [r4, #4]
	ldr	r6, .L26+16
	str	ip, [sp]
	sub	r0, r0, #2
	mov	lr, pc
	bx	r6
	mov	r3, #2
	ldr	r2, .L26+20
	str	r5, [r4, #8]
	str	r5, [r4, #12]
	str	r5, [r4]
	str	r5, [r4, #4]
	strh	r2, [r4, #36]	@ movhi
	str	r3, [r4, #24]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	chestsRemaining
	.word	mgba_printf
	.word	.LC1
	.word	24160
	.word	drawRectangle
	.word	32736
	.size	goToChestRetrieved, .-goToChestRetrieved
	.align	2
	.global	updateChests
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateChests, %function
updateChests:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L42
	ldr	r0, [r5]
	ldr	lr, [r4, #20]
	sub	sp, sp, #16
	add	r2, r0, #16
	ldr	ip, [r4, #16]
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	lr, [sp, #12]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	ldr	r6, .L42+4
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L31
	ldr	r3, .L42+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L31
	mov	r3, #1
	ldr	r1, [r5]
	str	r3, [r1, #24]
	str	r3, [r4, #24]
.L32:
	ldr	r2, [r1, #16]
	ldr	r3, [r1, #4]
	ldr	r0, [r4, #20]
	ldr	r1, [r1]
	add	r2, r2, r2, lsr #31
	sub	r3, r3, r0
	add	r2, r1, r2, asr #1
	ldr	r0, [r4]
	ldr	r1, [r4, #4]
	cmp	r3, #20
	str	r2, [r4]
	str	r0, [r4, #8]
	str	r3, [r4, #4]
	str	r1, [r4, #12]
	bgt	.L28
	mov	r0, r4
	bl	goToChestRetrieved
	mov	r2, #0
	ldr	r3, [r5]
	str	r2, [r3, #24]
	b	.L28
.L31:
	ldr	r3, [r4, #24]
	cmp	r3, #1
	beq	.L41
.L28:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L41:
	ldr	r1, [r5]
	b	.L32
.L43:
	.align	2
.L42:
	.word	player
	.word	collision
	.word	player1
	.size	updateChests, .-updateChests
	.comm	chestsRemaining,4,4
	.comm	sharkPointers,20,4
	.comm	sharkArr,180,4
	.comm	player,4,4
	.comm	player1,32,4
	.comm	chestPointers,16,4
	.comm	chestArr,160,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
