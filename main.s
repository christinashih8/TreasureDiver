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
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d\000"
	.text
	.align	2
	.global	updateGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L9
	mov	lr, pc
	bx	r3
	ldr	r4, .L9+4
	ldr	r6, .L9+8
	add	r5, r4, #20
.L2:
	ldr	r0, [r4], #4
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L2
	ldr	r4, .L9+12
	ldr	r6, .L9+16
	add	r5, r4, #16
.L3:
	ldr	r0, [r4], #4
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L3
	ldr	r4, .L9+20
	ldr	r3, [r4]
	cmp	r3, #14
	movgt	r3, #15
	strgt	r3, [r4]
	ldr	r3, .L9+24
	ldr	r5, .L9+28
	ldr	r2, [r3]
	ldr	r1, .L9+32
	ldr	r0, .L9+36
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	ldr	r1, .L9+32
	ldr	r0, .L9+40
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	updatePlayer
	.word	sharkPointers
	.word	updateShark
	.word	chestPointers
	.word	updateChests
	.word	oxygenLeft
	.word	chestsRemaining
	.word	sprintf
	.word	.LC0
	.word	buffer
	.word	oxBuffer
	.size	updateGame, .-updateGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L17
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	ldr	r4, .L17+4
	ldr	r6, .L17+8
	add	r5, r4, #20
.L12:
	ldr	r0, [r4], #4
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L12
	ldr	r4, .L17+12
	ldr	r6, .L17+16
	add	r5, r4, #16
.L13:
	ldr	r0, [r4], #4
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L13
	ldr	r6, .L17+20
	ldr	r5, .L17+24
	mov	r3, #8
	mov	r2, #6
	mov	r1, #1
	mov	r0, #104
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	ldr	r4, .L17+28
	mov	r3, #0
	mov	r1, #1
	mov	r0, #104
	ldr	r2, .L17+32
	mov	lr, pc
	bx	r4
	mov	r3, #8
	mov	r2, #12
	mov	r1, #1
	mov	r0, #222
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #0
	mov	r1, #1
	mov	r0, #222
	ldr	r2, .L17+36
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	drawPlayer
	.word	sharkPointers
	.word	drawShark
	.word	chestPointers
	.word	drawChests
	.word	29456
	.word	drawRectangle
	.word	drawString
	.word	buffer
	.word	oxBuffer
	.size	drawGame, .-drawGame
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"shark count: %d\000"
	.align	2
.LC2:
	.ascii	"TREASURE DIVER\000"
	.align	2
.LC3:
	.ascii	"Press start to play!\000"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L21
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+4
	mov	lr, pc
	bx	r3
	mov	r1, #5
	ldr	r0, .L21+8
	ldr	r3, .L21+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+16
	mov	lr, pc
	bx	r3
	ldr	r0, .L21+20
	ldr	r3, .L21+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L21+28
	mov	r1, #70
	mov	r0, #60
	ldr	r3, .L21+32
	ldr	r2, .L21+36
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #80
	mov	r0, #50
	ldr	r2, .L21+40
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #15
	ldr	r0, .L21+44
	ldr	ip, .L21+48
	ldr	r2, .L21+52
	strb	r3, [r0]
	str	r3, [ip]
	str	r1, [r2]
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	initSharks
	.word	initChests
	.word	.LC1
	.word	mgba_printf
	.word	initPlayer
	.word	24160
	.word	fillScreen
	.word	drawString
	.word	863
	.word	.LC2
	.word	.LC3
	.word	state
	.word	frameCounter
	.word	oxygenLeft
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L25
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r1, #0
	ldr	r3, .L25+4
	ldr	r0, .L25+8
	strh	r0, [r2]	@ movhi
	strh	r1, [r3]	@ movhi
	add	r2, r2, #256
	ldr	r3, .L25+12
	ldrh	r2, [r2, #48]
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	b	goToStart
.L26:
	.align	2
.L25:
	.word	mgba_open
	.word	oldButtons
	.word	1027
	.word	buttons
	.size	initialize, .-initialize
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"Chests Remaining: \000"
	.align	2
.LC5:
	.ascii	"O2 Left: \000"
	.text
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r0, .L29
	sub	sp, sp, #12
	ldr	r3, .L29+4
	mov	lr, pc
	bx	r3
	mov	r1, #0
	ldr	r3, .L29+8
	ldr	r5, .L29+12
	ldr	r4, .L29+16
	mov	r0, r1
	str	r3, [sp]
	mov	r2, #240
	mov	r3, #20
	mov	lr, pc
	bx	r4
	mov	r3, #4
	mov	r2, #8
	mov	r1, #10
	mov	r0, #20
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #3
	mov	r2, #6
	mov	r1, #1
	mov	r0, #120
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #4
	mov	r2, #7
	mov	r1, #11
	mov	r0, #183
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	ldr	r2, .L29+20
	mov	r3, #20
	str	r2, [sp]
	mov	r1, #140
	mov	r2, #240
	mov	r0, #0
	mov	lr, pc
	bx	r4
	mov	r1, #1
	ldr	r4, .L29+24
	mov	r0, r1
	mov	r3, #0
	ldr	r2, .L29+28
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #1
	mov	r0, #170
	ldr	r2, .L29+32
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L29+36
	strb	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	24160
	.word	fillScreen
	.word	29456
	.word	32767
	.word	drawRectangle
	.word	21245
	.word	drawString
	.word	.LC4
	.word	.LC5
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L33
	mov	r0, #0
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L33+4
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	fillScreen
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #3
	ldr	r3, .L36
	strb	r2, [r3]
	bx	lr
.L37:
	.align	2
.L36:
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"You won!\000"
	.align	2
.LC7:
	.ascii	"Press start to play again!\000"
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L40
	ldr	r3, .L40+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L40+8
	mov	r3, #0
	mov	r1, #60
	mov	r0, #100
	ldr	r2, .L40+12
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L40+16
	mov	r1, #70
	mov	r0, #50
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L40+20
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	32767
	.word	fillScreen
	.word	drawString
	.word	.LC6
	.word	.LC7
	.word	state
	.size	goToWin, .-goToWin
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"this should be restoring oxygen\000"
	.align	2
.LC9:
	.ascii	"Game has been paused!\000"
	.align	2
.LC10:
	.ascii	"You lost!\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r8, .L84
	ldr	r4, .L84+4
	ldr	r3, .L84+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L84+12
	ldrh	r2, [r4]
	ldrb	r1, [r8]	@ zero_extendqisi2
	ldr	r10, .L84+16
	ldr	fp, .L84+20
	ldr	r7, .L84+24
	ldr	r9, .L84+28
	ldr	r6, .L84+32
.L43:
	strh	r2, [r5]	@ movhi
	ldrh	r3, [r6, #48]
	strh	r3, [r4]	@ movhi
	cmp	r1, #4
	ldrls	pc, [pc, r1, asl #2]
	b	.L69
.L48:
	.word	.L52
	.word	.L51
	.word	.L50
	.word	.L49
	.word	.L47
.L50:
	ldr	r2, .L84+36
	mov	r1, #60
	mov	r0, #50
	ldr	r3, .L84+40
	mov	lr, pc
	bx	r9
	ldrh	r2, [r4]
	tst	r2, #4
	bne	.L80
	ldrh	r3, [r5]
	tst	r3, #4
	bne	.L64
.L80:
	ldrb	r1, [r8]	@ zero_extendqisi2
	b	.L43
.L51:
	ldr	r3, .L84+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+56
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r3, #20
	ble	.L81
	ldr	r3, [fp]
	add	r3, r3, #1
	cmp	r3, #59
	movgt	r2, #0
	ldrgt	r3, [r10]
	subgt	r3, r3, #1
	strle	r3, [fp]
	strgt	r3, [r10]
	strgt	r2, [fp]
.L56:
	ldrh	r0, [r4]
	ands	r0, r0, #4
	bne	.L58
	ldrh	r3, [r5]
	tst	r3, #4
	bne	.L82
.L58:
	mov	r1, #0
	ldr	r3, .L84+60
.L60:
	ldr	r2, [r3, #28]
	add	r3, r3, #40
	cmp	r2, #0
	addeq	r1, r1, #1
	cmp	r3, r7
	bne	.L60
	cmp	r1, #4
	beq	.L83
.L61:
	ldr	r3, [r10]
	cmp	r3, #0
	ldrh	r2, [r4]
	bne	.L80
	mov	r3, #3
	strh	r2, [r5]	@ movhi
	strb	r3, [r8]
	ldrh	r3, [r6, #48]
	strh	r3, [r4]	@ movhi
.L49:
	ldr	r3, .L84+48
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r3, .L84+64
	mov	lr, pc
	bx	r3
	mov	r1, #60
	mov	r0, #100
	ldr	r3, .L84+40
	ldr	r2, .L84+68
	mov	lr, pc
	bx	r9
	ldr	r2, .L84+72
	mov	r1, #70
	mov	r0, #30
	ldr	r3, .L84+40
	mov	lr, pc
	bx	r9
	ldrh	r2, [r4]
	tst	r2, #8
	bne	.L80
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L80
.L79:
	ldr	r3, .L84+76
	mov	lr, pc
	bx	r3
	ldrh	r2, [r4]
	b	.L80
.L53:
	strh	r3, [r5]	@ movhi
	ldrh	r1, [r6, #48]
	mov	r2, r3
	mov	r3, r1
	strh	r1, [r4]	@ movhi
.L52:
	tst	r3, #8
	bne	.L53
	tst	r2, #8
	beq	.L53
.L64:
	ldr	r3, .L84+80
	mov	lr, pc
	bx	r3
	ldrh	r2, [r4]
	ldrb	r1, [r8]	@ zero_extendqisi2
	b	.L43
.L67:
	strh	r3, [r5]	@ movhi
	ldrh	r1, [r6, #48]
	mov	r2, r3
	mov	r3, r1
	strh	r1, [r4]	@ movhi
.L47:
	tst	r3, #8
	bne	.L67
	tst	r2, #8
	beq	.L67
	b	.L79
.L81:
	ldr	r3, .L84+84
	ldr	r0, .L84+88
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, [r10]
	add	r3, r3, #1
	str	r3, [r10]
	str	r2, [fp]
	b	.L56
.L83:
	ldr	r3, .L84+92
	mov	lr, pc
	bx	r3
	b	.L61
.L82:
	ldr	r3, .L84+64
	mov	lr, pc
	bx	r3
	mov	r3, #2
	strb	r3, [r8]
	b	.L58
.L69:
	mov	r2, r3
	b	.L43
.L85:
	.align	2
.L84:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	oxygenLeft
	.word	frameCounter
	.word	chestArr+160
	.word	drawString
	.word	67109120
	.word	.LC9
	.word	32767
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	player
	.word	chestArr
	.word	fillScreen
	.word	.LC10
	.word	.LC7
	.word	goToStart
	.word	goToGame
	.word	mgba_printf
	.word	.LC8
	.word	goToWin
	.size	main, .-main
	.text
	.align	2
	.global	checkWinCondition
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkWinCondition, %function
checkWinCondition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	ldr	r3, .L90
	add	r1, r3, #160
.L88:
	ldr	r2, [r3, #28]
	add	r3, r3, #40
	cmp	r2, #0
	addeq	r0, r0, #1
	cmp	r3, r1
	bne	.L88
	sub	r3, r0, #4
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	bx	lr
.L91:
	.align	2
.L90:
	.word	chestArr
	.size	checkWinCondition, .-checkWinCondition
	.comm	state,1,1
	.comm	oxygenLeft,4,4
	.comm	frameCounter,4,4
	.comm	oxBuffer,41,4
	.comm	buffer,41,4
	.comm	sharkPointers,20,4
	.comm	sharkArr,180,4
	.comm	player,4,4
	.comm	player1,32,4
	.comm	chestPointers,16,4
	.comm	chestArr,160,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
