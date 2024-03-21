#ifndef PLAYER_H
#define PLAYER_H

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

#endif