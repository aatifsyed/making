#ifndef PRINT_COLOURFUL_H_INCLUDED
#define PRINT_COLOURFUL_H_INCLUDED

typedef enum colour {
black = 30,
red,
green,
yellow,
blue,
magenta,
cyan,
white
} COLOUR;

// extern means these functions will be linked in later (but is not necessary)
extern void print_colourful(COLOUR colour, char* str, ...);
extern void set_colour(COLOUR color);
extern void unset_colour();

#endif