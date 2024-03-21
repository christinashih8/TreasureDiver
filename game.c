#include "game.h"
#include "gba.h"
#include "player.h"
#include "enemy.h"

//func prototypes
void goToChestPickedUp(CHEST* currChest);
void goToChestRetrieved(CHEST* currChest);

enum chestState{
    STATIONARY,
    PICKEDUP,
    RETRIEVED
};

int chestsRemaining;
void initGame() {
    //fillScreen(BG_COLOR);
    mgba_printf("correctly updated!");
}

void initChests() {
    for (int i = 0; i < CHEST_COUNT; i++) {
        chestArr[i].x = 10 + i * 70;
        chestArr[i].y = 136;
        chestArr[i].oldX = 10 + i * 70;
        chestArr[i].oldY = 136;
        chestArr[i].width = 6;
        chestArr[i].height = 4;
        chestArr[i].color = BROWN;
        chestArr[i].state = STATIONARY;
        chestArr[i].active = 1;
        chestArr[i].erased = 0;
        
        chestPointers[i] = &chestArr[i];
    }
    chestsRemaining = CHEST_COUNT;
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
        drawRectangle(currChest->oldX, currChest->oldY, currChest->width, currChest->height, BG_COLOR);
        drawRectangle(currChest->x, currChest->y, currChest->width, currChest->height, currChest->color);
        drawRectangle(currChest->x, currChest->y + 1, currChest->width, 1, GOLD);
        drawRectangle(currChest->x + 2, currChest->y + 1, 2, 2, SILVER);
    }
}

void goToChestPickedUp(CHEST* currChest) {
    
    currChest->state = PICKEDUP;
}

void goToChestRetrieved(CHEST* currChest) {
    currChest->active = 0;
    chestsRemaining--;
    mgba_printf("chests remaining %d", chestsRemaining);
    drawRectangle(currChest->x - 2, currChest->y, 12, 12, BG_COLOR);
    currChest->oldX = 0;
    currChest->oldY = 0;
    currChest->x = 0;
    currChest->y = 0;
    currChest->color = CYAN;
    currChest->state = RETRIEVED;
}