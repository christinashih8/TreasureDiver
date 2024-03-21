#ifndef GAME_H
#define GAME_H

#define CHEST_COUNT 4

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

CHEST chestArr[CHEST_COUNT];
CHEST* chestPointers[CHEST_COUNT];

#endif