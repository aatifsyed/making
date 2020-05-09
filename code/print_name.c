#include <stdio.h>
#include <print_colourful.h>
#define LEN 10

int main()
{
    char name[LEN];
    fputs("Input name: ", stdout);
    fgets(&name[0], sizeof(name), stdin);

    set_colour(red);
    fputs("Your name is : ", stdout);
    fputs(name, stdout);
    unset_colour();

    return 0;
}