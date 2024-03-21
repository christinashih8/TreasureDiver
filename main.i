# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
# 25 "gba.h"
extern volatile unsigned short* videoBuffer;
# 37 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 64 "gba.h"
void drawHorizontalLine(int y, int x1, int x2, unsigned short color);
void drawVerticalLine(int x, int y1, int y2, unsigned short color);
void drawRightTriangle(int x, int y, int length, u16 color);
void drawRightTriangleMirror(int x, int y, int length, u16 color);
void drawRectangle(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
void drawChar(int x, int y, char ch, unsigned short color);
void drawString(int x, int y, char *str, unsigned short color);
# 86 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;





typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 126 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "main.c" 2
# 1 "print.h" 1
# 26 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 3 "main.c" 2
# 1 "game.h" 1





void initGame();


typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int width;
    int height;
    int state;
    int active;
    int erased;
    unsigned short color;
} CHEST;

CHEST chestArr[4];
CHEST* chestPointers[4];
# 4 "main.c" 2
# 1 "player.h" 1



typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int width;
    int height;
    int holdingChest;
    unsigned short color;
} PLAYER;

PLAYER player1;
PLAYER* player;
# 5 "main.c" 2
# 1 "enemy.h" 1





typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int width;
    int height;
    unsigned short color;
    int speedModifier;
    int state;
} SHARK;

SHARK sharkArr[5];
SHARK* sharkPointers[5];
# 6 "main.c" 2


void initialize();
void updateGame();
void drawGame();
void goToStart();
void goToGame();
void goToPause();
void goToLose();
void goToWin();

char buffer[41];
char oxBuffer[41];
extern int chestsRemaining;
int frameCounter;
int oxygenLeft;

enum STATE {
    START,
    GAME,
    PAUSE,
    LOSE,
    WIN
} state;

int main() {

    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);
        switch (state) {
            case 0:
                if (((~buttons & ((1<<3))) && !(~oldButtons & ((1<<3))))) {
                    goToGame();
                }
                break;
            case 1:
                updateGame();
                waitForVBlank();
                drawGame();
                if (player -> y <= 20) {

                    mgba_printf("this should be restoring oxygen");
                    oxygenLeft++;
                    frameCounter = 0;
                } else {
                    frameCounter++;
                }
                if (frameCounter >= 60) {
                    frameCounter = 0;
                    oxygenLeft--;
                }
                if (((~buttons & ((1<<2))) && !(~oldButtons & ((1<<2))))) {
                    goToPause();
                }
                if (checkWinCondition()) {
                    goToWin();
                }
                if (oxygenLeft == 0) {
                    goToLose();
                }

                break;
            case 2:
                drawString(50, 60, "Game has been paused!", (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
                if (((~buttons & ((1<<2))) && !(~oldButtons & ((1<<2))))) {
                    goToGame();
                }
                break;
            case 3:
                waitForVBlank();
                fillScreen((((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
                drawString(100, 60, "You lost!", (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
                drawString(30, 70, "Press start to play again!", (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
                if (((~buttons & ((1<<3))) && !(~oldButtons & ((1<<3))))) {
                    goToStart();
                }
                break;
            case 4:
                if (((~buttons & ((1<<3))) && !(~oldButtons & ((1<<3))))) {
                    goToStart();
                }
                break;
        }
    }

    return 0;

}

void initialize() {

    mgba_open();
    (*(volatile unsigned short *)0x4000000) = ((1 << (8 + ((2) % 4)))) | ((3) & 7);
    oldButtons = 0;
    buttons = (*(volatile unsigned short *)0x04000130);


    goToStart();
}

void updateGame() {
    updatePlayer();
    for (int i = 0; i < 5; i++) {
        updateShark(sharkPointers[i]);
    }
    for (int i = 0; i < 4; i++) {
        updateChests(chestPointers[i]);
    }
    if (oxygenLeft >= 15) {
        oxygenLeft = 15;
    }
    sprintf(buffer, "%d", chestsRemaining);
    sprintf(oxBuffer, "%d", oxygenLeft);
}

void drawGame() {
    drawPlayer();
    for (int i = 0; i < 5; i++) {
        drawShark(sharkPointers[i]);
    }
    for (int i = 0; i < 4; i++) {
        drawChests(chestPointers[i]);
    }
    drawRectangle(104, 1, 6, 8, (((16) & 31) | ((24) & 31) << 5 | ((28) & 31) << 10));
    drawString(104, 1, buffer, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));

    drawRectangle(222, 1, 12, 8, (((16) & 31) | ((24) & 31) << 5 | ((28) & 31) << 10));
    drawString(222, 1, oxBuffer, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
}

void goToStart() {
    initSharks();
    initChests();
    mgba_printf("shark count: %d", 5);
    initPlayer();
    fillScreen((((0) & 31) | ((19) & 31) << 5 | ((23) & 31) << 10));
    drawString(60, 70, "TREASURE DIVER", (((31) & 31) | ((26) & 31) << 5 | ((0) & 31) << 10));
    drawString(50, 80, "Press start to play!", (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    frameCounter = 0;
    oxygenLeft = 15;
    state = START;
}
void goToGame() {
    fillScreen((((0) & 31) | ((19) & 31) << 5 | ((23) & 31) << 10));
    drawRectangle(0, 0, 240, 20, (((16) & 31) | ((24) & 31) << 5 | ((28) & 31) << 10));
    drawRectangle(20, 10, 8, 4, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(120, 1, 6, 3, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(183, 11, 7, 4, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(0, 140, 240, 20, (((29) & 31) | ((23) & 31) << 5 | ((20) & 31) << 10));
    drawString(1, 1, "Chests Remaining: ", (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    drawString(170, 1, "O2 Left: ", (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    state = GAME;
}

void goToPause() {
    fillScreen((((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    state = PAUSE;
}

void goToLose() {
    state = LOSE;
}

void goToWin() {
    fillScreen((((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawString(100, 60, "You won!", (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    drawString(50, 70, "Press start to play again!", (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    state = WIN;
}

int checkWinCondition() {
    int retrievedChests = 0;
    for (int i = 0; i < 4; i++) {
        if (chestArr[i].active == 0) {
            retrievedChests++;
        }
    }
    return retrievedChests == 4;
}
