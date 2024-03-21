# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
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
# 3 "game.c" 2
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
# 4 "game.c" 2
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
# 5 "game.c" 2


void goToChestPickedUp(CHEST* currChest);
void goToChestRetrieved(CHEST* currChest);

enum chestState{
    STATIONARY,
    PICKEDUP,
    RETRIEVED
};

int chestsRemaining;
void initGame() {

    mgba_printf("correctly updated!");
}

void initChests() {
    for (int i = 0; i < 4; i++) {
        chestArr[i].x = 10 + i * 70;
        chestArr[i].y = 136;
        chestArr[i].oldX = 10 + i * 70;
        chestArr[i].oldY = 136;
        chestArr[i].width = 6;
        chestArr[i].height = 4;
        chestArr[i].color = (((20) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10);
        chestArr[i].state = STATIONARY;
        chestArr[i].active = 1;
        chestArr[i].erased = 0;

        chestPointers[i] = &chestArr[i];
    }
    chestsRemaining = 4;
}

void updateChests(CHEST* currChest) {
    if (currChest->active) {
    if (collision(player->x, player->y, player->width, player->height,
    currChest->x, currChest->y, currChest->width, currChest->height) && !(player1.holdingChest)) {
        player->holdingChest = 1;
        goToChestPickedUp(currChest);
    }
    switch (currChest->state) {
        case 0:
            break;
        case 1:
            currChest->oldX = currChest->x;
            currChest->oldY = currChest->y;
            currChest->x = player->x + (player->width / 2);
            currChest->y = player->y - currChest->height;

            if (currChest -> y <= 20) {
                goToChestRetrieved(currChest);
                player->holdingChest = 0;
            }

            break;
        case 2:
            break;
    }
    }


}

void drawChests(CHEST* currChest) {
    if (currChest->active) {
        drawRectangle(currChest->oldX, currChest->oldY, currChest->width, currChest->height, (((0) & 31) | ((19) & 31) << 5 | ((23) & 31) << 10));
        drawRectangle(currChest->x, currChest->y, currChest->width, currChest->height, currChest->color);
        drawRectangle(currChest->x, currChest->y + 1, currChest->width, 1, (((31) & 31) | ((26) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(currChest->x + 2, currChest->y + 1, 2, 2, (((23) & 31) | ((23) & 31) << 5 | ((23) & 31) << 10));
    }
}

void goToChestPickedUp(CHEST* currChest) {

    currChest->state = PICKEDUP;
}

void goToChestRetrieved(CHEST* currChest) {
    currChest->active = 0;
    chestsRemaining--;
    mgba_printf("chests remaining %d", chestsRemaining);
    drawRectangle(currChest->x - 2, currChest->y, 12, 12, (((0) & 31) | ((19) & 31) << 5 | ((23) & 31) << 10));
    currChest->oldX = 0;
    currChest->oldY = 0;
    currChest->x = 0;
    currChest->y = 0;
    currChest->color = (((0) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10);
    currChest->state = RETRIEVED;
}
