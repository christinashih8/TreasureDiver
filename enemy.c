#include "enemy.h"
#include "game.h"
#include "gba.h"
#include "player.h"


//func prototypes
void goTocurrSharkMoveLeft(SHARK* currShark);
void goTocurrSharkMoveRight(SHARK* currShark);
void currSharkMoveLeft(SHARK* currShark);
void currSharkMoveRight(SHARK* currShark);

enum sharkState {
    MOVING_RIGHT,
    MOVING_LEFT
};

void initSharks() {
    for (int i = 0; i < SHARK_COUNT; i++) {
        sharkArr[i].x = 0 + i * 20;
        sharkArr[i].y = 40 + i * 20;
        sharkArr[i].oldX = 0 + i * 20;
        sharkArr[i].oldY = 20 + i * 20;
        sharkArr[i].width = 8;
        sharkArr[i].height = 4;
        sharkArr[i].color = SHARK_COLOR;
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

    if (currShark-> x >= (SCREENWIDTH -  (currShark->width)) 
        && currShark->state == MOVING_RIGHT) {
        //mgba_printf("Switched to left!");
        goTocurrSharkMoveLeft(currShark);
    }
    if (currShark -> x <= 0 && currShark->state == MOVING_LEFT) {
        //mgba_printf("Switched to right!");
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
            drawRectangle(currShark->oldX, currShark->oldY, currShark->width, currShark->height, BG_COLOR);

            drawRectangle(currShark->x, currShark->y, currShark->width, currShark->height, currShark->color);
            break;
        case 1:
            drawRectangle(currShark->oldX, currShark->oldY, currShark->width, currShark->height, BG_COLOR);
            
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