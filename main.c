#include "gba.h"
#include "print.h"
#include "game.h"
#include "player.h"
#include "enemy.h"

// Function Prototypes
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
        buttons = REG_BUTTONS;
        switch (state) {
            case 0:
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToGame();
                }
                break;
            case 1:
                updateGame();
                waitForVBlank();
                drawGame();
                if (player -> y <= 20) {
                    //player->oldX = player->x;
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
                if (BUTTON_PRESSED(BUTTON_SELECT)) {
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
                drawString(50, 60, "Game has been paused!", WHITE);
                if (BUTTON_PRESSED(BUTTON_SELECT)) {
                    goToGame();
                }
                break;
            case 3:
                waitForVBlank();
                fillScreen(BLACK);
                drawString(100, 60, "You lost!", WHITE);
                drawString(30, 70, "Press start to play again!", WHITE);
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToStart();
                }
                break;
            case 4:
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToStart();
                }
                break;
        }
    }

    return 0;

}

void initialize() {

    mgba_open();
    REG_DISPCTL = BG2_ENABLE | MODE3;
    oldButtons = 0;
    buttons = REG_BUTTONS;
    
    //initGame();
    goToStart();
}

void updateGame() {
    updatePlayer();
    for (int i = 0; i < SHARK_COUNT; i++) {
        updateShark(sharkPointers[i]);
    }
    for (int i = 0; i < CHEST_COUNT; i++) {
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
    for (int i = 0; i < SHARK_COUNT; i++) {
        drawShark(sharkPointers[i]);
    }
    for (int i = 0; i < CHEST_COUNT; i++) {
        drawChests(chestPointers[i]);
    }
    drawRectangle(104, 1, 6, 8, SKY_BLUE);
    drawString(104, 1, buffer, BLACK);

    drawRectangle(222, 1, 12, 8, SKY_BLUE);
    drawString(222, 1, oxBuffer, BLACK);
}

void goToStart() {
    initSharks();
    initChests();
    mgba_printf("shark count: %d", SHARK_COUNT);
    initPlayer();
    fillScreen(BG_COLOR);
    drawString(60, 70, "TREASURE DIVER", GOLD);
    drawString(50, 80, "Press start to play!", BLACK);
    frameCounter = 0;
    oxygenLeft = 15;
    state = START;
}
void goToGame() {
    fillScreen(BG_COLOR);
    drawRectangle(0, 0, SCREENWIDTH, 20, SKY_BLUE);
    drawRectangle(20, 10, 8, 4, WHITE);
    drawRectangle(120, 1, 6, 3, WHITE);
    drawRectangle(183, 11, 7, 4, WHITE);
    drawRectangle(0, 140, SCREENWIDTH, 20, SAND_COLOR);
    drawString(1, 1, "Chests Remaining: ", BLACK);
    drawString(170, 1, "O2 Left: ", BLACK);
    state = GAME;
}

void goToPause() {
    fillScreen(BLACK);
    state = PAUSE;
}

void goToLose() {
    state = LOSE;
}

void goToWin() {
    fillScreen(WHITE);
    drawString(100, 60, "You won!", BLACK);
    drawString(50, 70, "Press start to play again!", BLACK);
    state = WIN;
}

int checkWinCondition() {
    int retrievedChests = 0;
    for (int i = 0; i < CHEST_COUNT; i++) {
        if (chestArr[i].active == 0) {
            retrievedChests++;
        }
    }
    return retrievedChests == CHEST_COUNT;
}