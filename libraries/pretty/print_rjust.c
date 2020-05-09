#include <string.h>
#include <stdio.h>

void print_rjust(int width, char* str)
{
    int string_length = strlen(str);
    int padding = width - string_length;

    if (padding > 0)
    {
        for (int i = 0; i < padding; i++)
        {
            printf(" ");
        }
    }

    printf("%s\n", str);
}