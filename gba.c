#include "gba.h"
#include "font.h"

volatile unsigned short* videoBuffer = (unsigned short *)0x6000000;
unsigned short oldButtons, buttons;

void drawHorizontalLine(int y, int x1, int x2, unsigned short color) {
    for (int i = x1; i <= x2; i++) {
        setPixel(i, y, color);
    }
}

void drawVerticalLine(int x, int y1, int y2, unsigned short color) {
    for (int i = y1; i <= y2; i++) {
        setPixel(x, i, color);
    }
}


void drawRightTriangle(int x, int y, int length, u16 color) {
    for (int i = 0; i < length; i++) {
        drawHorizontalLine(y + i, x, x + i, color);
    }
}


void drawRightTriangleMirror(int x, int y, int length, u16 color) {
    for (int i = 0; i < length; i++) {
        drawHorizontalLine(y + i, x - i, x, color);
    }
}



void drawRectangle(int x, int y, int width, int height, volatile unsigned short color) {
    // for (int i = 0; i < width; i++) {
    //     for (int j = 0; j < height; j++) {
    //         setPixel(x + i, y + j, color);
    //     }
    // }
    //TODO: Replace the above implementation by using DMA
    for (int i = 0; i < height; i++) {
        DMANow(3, &color, &videoBuffer[OFFSET(x, y + i, SCREENWIDTH)], DMA_16 | width | DMA_DESTINATION_INCREMENT | DMA_SOURCE_FIXED);
    }
}

void fillScreen(volatile unsigned short color) {
    // for (int i = 0; i < 240 * 160; i++) {
    //     videoBuffer[i] = color;
    // }
    //TODO: Replace the above implementation by using DMA
    DMANow(3, &color, videoBuffer, DMA_16 | (240 * 160) | DMA_DESTINATION_INCREMENT | DMA_SOURCE_FIXED);
}

void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}

int collision(int xA, int yA, int widthA, int heightA, int xB, int yB, int widthB, int heightB) {
    return yA <= yB + heightB - 1 && yA + heightA - 1 >= yB && xA <= xB + widthB - 1 && xA + widthA - 1 >= xB;
}

// Draws the specified character at the specified location in Mode 3
void drawChar(int x, int y, char ch, unsigned short color) {
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            if (fontdata[(48 * ch + i + 6 * j)]) {
                setPixel(x + i, y + j, color);
            }
        }
    }
}

// Draws the specified string at the specified location in Mode 3
void drawString(int x, int y, char *str, unsigned short color) {
    int i = 0;
    while (str[i] != '\0') {
        drawChar(x + (i * 6), y, str[i], color);
        i++;
    }
}

// Pointer to the start of DMA registers
DMA *dma = (DMA *)0x40000B0;

// Immediately begins a DMA transfer using parameters
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    //TODO: Complete the DMANow function
    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = cnt | DMA_ON;

}