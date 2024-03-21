#include "player.h"
#include "game.h"
#include "gba.h"

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
    player1.color = GREEN;

    player = &player1;
}

void updatePlayer() {
    player->oldX = player->x;
    player->oldY = player->y;
    if (player-> x >= (SCREENWIDTH - (player->width))) {
        //player->oldX = player->x;
        player-> x = (SCREENWIDTH -  (player->width));
    }
    if (player -> x <= 1) {
        //player->oldX = player->x;
        player->x = 1;
        //oxygenLeft++;
    }
    if (player-> y >= 139 - player-> height) {
        //player->oldY = player->y;
        player-> y = 139 - player-> height;
    }
    if (player -> y <= 21) {
        //player->oldY = player->y;

        player->y = 21;
    }

    
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player->x--;
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player->x++;
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        player->y++;
    }
    if (BUTTON_HELD(BUTTON_UP)) {
        player->y--;
    }
}

void drawPlayer() {
    drawRectangle(player->oldX, player->oldY, player->width, player->height, BG_COLOR);
    drawRectangle(player->x, player->y, player->width, player->height, player->color);
}