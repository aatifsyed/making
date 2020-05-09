# Compiling Library
## C files into object files
`gcc -o output/objects/print_rjust.o -c libraries/pretty/print_rjust.c` will `c`ompile the source file, and `o`utput an object file

`gcc -o output/objects/print_colourful.o -c libraries/pretty/print_colourful.c -Iinterfaces/` specifies the `I`nclude directory

`readelf -s output/objects/print_colourful.o` will print the `s`ymbols in the object, Can also use `nm`, below, but `nm -t` is temperamental?

## Combine our two object files into one library
`ar cr output/libraries/libpretty.a output/objects/print_colourful.o output/objects/print_rjust.o`

We now have a library that we can link to.
See what symbols are in the library with `nm output/libraries/libpretty.a`

# Linking to that library
`gcc -o output/executables/print_name code/print_name.c -Iinterfaces/ output/libraries/libpretty.a`, and the library must be specified last...?

`gcc -o output/executables/print_name code/print_name.c -Iinterfaces/ -Loutput/libraries -lpretty` to look in the `L`ibrary directory for the `l`ibrary

# Links
https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html

https://www.cs.swarthmore.edu/~newhall/unixhelp/howto_C_libraries.html

https://www.cs.dartmouth.edu/~campbell/cs50/buildlib.html