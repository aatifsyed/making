#include <pretty.h>
#include <stdarg.h>
#include <stdio.h>

void print_colourful(COLOUR colour, char* str, ...)
{
    va_list args;
    printf("\033[0;%dm", colour);
    va_start(args, str);
    // printf is a wrapper around vprintf that turns args into a va_list.
    // We've already done that, so use vprintf here
    vprintf(str, args);
    va_end(args);
    printf("\033[0m");
}

void set_colour(COLOUR colour)
{
    printf("\033[0;%dm", colour);
}

void unset_colour()
{
    printf("\033[0m");
}