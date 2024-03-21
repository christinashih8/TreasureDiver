# 1 "enemy.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "enemy.c"
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
# 2 "enemy.c" 2
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
# 3 "enemy.c" 2
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
# 4 "enemy.c" 2
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
# 5 "enemy.c" 2



void goTocurrSharkMoveLeft(SHARK* currShark);
void goTocurrSharkMoveRight(SHARK* currShark);
void currSharkMoveLeft(SHARK* currShark);
void currSharkMoveRight(SHARK* currShark);

enum sharkState {
    MOVING_RIGHT,
    MOVING_LEFT
};

void initSharks() {
    for (int i = 0; i < 5; i++) {
        sharkArr[i].x = 0 + i * 20;
        sharkArr[i].y = 40 + i * 20;
        sharkArr[i].oldX = 0 + i * 20;
        sharkArr[i].oldY = 20 + i * 20;
        sharkArr[i].width = 8;
        sharkArr[i].height = 4;
        sharkArr[i].color = (((6) & 31) | ((9) & 31) << 5 | ((19) & 31) << 10);
        sharkArr[i].speedModifier = 1 + i;
        sharkArr[i].state = MOVING_RIGHT + (i % 2);
        mgba_printf("initialized %d sharks", i);

        sharkPointers[i] = &sharkArr[i];
    }
}

void updateShark(SHARK* currShark) {
    currShark->oldX = currShark->x;
    currShark->oldY = currShark->y;

    if (collision(player->x, player->y, player->width, player->height,
    currShark->x, currShark->y, currShark->width, currShark->height)) {
        goToLose();
    }

    if (currShark-> x >= (240 - (currShark->width))
        && currShark->state == MOVING_RIGHT) {

        goTocurrSharkMoveLeft(currShark);
    }
    if (currShark -> x <= 0 && currShark->state == MOVING_LEFT) {

        goTocurrSharkMoveRight(currShark);
    }
    switch (currShark->state) {
        case 0:
            currSharkMoveRight(currShark);
            break;
        case 1:
            currSharkMoveLeft(currShark);
            break;
    }
}

void drawShark(SHARK* currShark) {
    switch (currShark->state) {
        case 0:
            drawRectangle(currShark->oldX, currShark->oldY, currShark->width, currShark->height, (((0) & 31) | ((19) & 31) << 5 | ((23) & 31) << 10));

            drawRectangle(currShark->x, currShark->y, currShark->width, currShark->height, currShark->color);
            break;
        case 1:
            drawRectangle(currShark->oldX, currShark->oldY, currShark->width, currShark->height, (((0) & 31) | ((19) & 31) << 5 | ((23) & 31) << 10));

            drawRectangle(currShark->x, currShark->y, currShark->width, currShark->height, currShark->color);
            break;
    }

}

void goTocurrSharkMoveLeft(SHARK* currShark) {
    currShark->state = MOVING_LEFT;
}

void goTocurrSharkMoveRight(SHARK* currShark) {
    currShark->state = MOVING_RIGHT;
}

void currSharkMoveLeft(SHARK* currShark) {
    currShark->x += ((currShark -> speedModifier) * -1);
}

void currSharkMoveRight(SHARK* currShark) {
    currShark->x += (currShark->speedModifier);
}
