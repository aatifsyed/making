[Tutorial I'm following](https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html)

`gcc -o hello_world code/hello_world.c` will produce an executable in `.`

`gcc -c code/hello_world.c` will produce the object file `hello_world.o`

The object file is machine code interlaced with *symbols*, which are the names of global objects, functions that are then used for linking

You can look inside them with `nm` or `objdump -t`

`gcc -o hello_world hello_world.o` will make the executable from the object code, substituting in the symbols for more machine code

https://www.cs.swarthmore.edu/~newhall/unixhelp/howto_C_libraries.html
