# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
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
# 2 "gba.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata[12288];
# 3 "gba.c" 2

volatile unsigned short* videoBuffer = (unsigned short *)0x6000000;
unsigned short oldButtons, buttons;

void drawHorizontalLine(int y, int x1, int x2, unsigned short color) {
    for (int i = x1; i <= x2; i++) {
        (videoBuffer[((y) * (240) + (i))] = color);
    }
}

void drawVerticalLine(int x, int y1, int y2, unsigned short color) {
    for (int i = y1; i <= y2; i++) {
        (videoBuffer[((i) * (240) + (x))] = color);
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






    for (int i = 0; i < height; i++) {
        DMANow(3, &color, &videoBuffer[((y + i) * (240) + (x))], (0 << 26) | width | (0 << 21) | (2 << 23));
    }
}

void fillScreen(volatile unsigned short color) {




    DMANow(3, &color, videoBuffer, (0 << 26) | (240 * 160) | (0 << 21) | (2 << 23));
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) >= 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}

int collision(int xA, int yA, int widthA, int heightA, int xB, int yB, int widthB, int heightB) {
    return yA <= yB + heightB - 1 && yA + heightA - 1 >= yB && xA <= xB + widthB - 1 && xA + widthA - 1 >= xB;
}


void drawChar(int x, int y, char ch, unsigned short color) {
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            if (fontdata[(48 * ch + i + 6 * j)]) {
                (videoBuffer[((y + j) * (240) + (x + i))] = color);
            }
        }
    }
}


void drawString(int x, int y, char *str, unsigned short color) {
    int i = 0;
    while (str[i] != '\0') {
        drawChar(x + (i * 6), y, str[i], color);
        i++;
    }
}


DMA *dma = (DMA *)0x40000B0;


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = cnt | (1 << 31);

}
