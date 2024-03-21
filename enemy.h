#ifndef ENEMY_H
#define ENEMY_H

#define SHARK_COUNT 5

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

SHARK sharkArr[SHARK_COUNT];
SHARK* sharkPointers[SHARK_COUNT];

#endif