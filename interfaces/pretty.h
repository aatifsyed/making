#ifndef PRETTY_H_INCLUDED
#define PRETTY_H_INCLUDED

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

extern void printf_colourful(COLOUR colour, char* str, ...);
extern void set_colour(COLOUR color);
extern void unset_colour();

extern void print_rjust(int width, char* str);

#endif