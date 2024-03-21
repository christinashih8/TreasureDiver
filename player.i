# 1 "player.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player.c"
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
# 2 "player.c" 2
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
# 3 "player.c" 2
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
# 4 "player.c" 2

void initPlayer();
void updatePlayer();
void drawPlayer();

extern int oxygenLeft;

void initPlayer() {
    player1.x = 120;
    player1.y = 20;
    player1.oldX = 120;
    player1.oldY = 20;
    player1.width = 4;
    player1.height = 4;
    player1.holdingChest = 0;
    player1.color = (((0) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10);

    player = &player1;
}

void updatePlayer() {
    player->oldX = player->x;
    player->oldY = player->y;
    if (player-> x >= (240 - (player->width))) {

        player-> x = (240 - (player->width));
    }
    if (player -> x <= 1) {

        player->x = 1;

    }
    if (player-> y >= 139 - player-> height) {

        player-> y = 139 - player-> height;
    }
    if (player -> y <= 21) {


        player->y = 21;
    }


    if ((~buttons & ((1<<5)))) {
        player->x--;
    }
    if ((~buttons & ((1<<4)))) {
        player->x++;
    }
    if ((~buttons & ((1<<7)))) {
        player->y++;
    }
    if ((~buttons & ((1<<6)))) {
        player->y--;
    }
}

void drawPlayer() {
    drawRectangle(player->oldX, player->oldY, player->width, player->height, (((0) & 31) | ((19) & 31) << 5 | ((23) & 31) << 10));
    drawRectangle(player->x, player->y, player->width, player->height, player->color);
}
