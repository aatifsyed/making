#include <string.h>
#include <stdio.h>

void strip_trailing_newline(char* str)
{
    int last_character = strlen(str) - 1;

    if (str[last_character] == '\n')
    {
        str[last_character] = '\0';
    }
}

void print_rjust(int width, char* str)
{
    strip_trailing_newline(str);

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