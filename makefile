SHELL = bash # for expansion

CC = gcc
CFLAGS = -I$(INC_DIR)

INC_DIR = interfaces/
OBJ_DIR = output/objects/
EXE_DIR = output/executables/
LIB_DIR = output/libraries/

# $@ : $^     refers to all of the RHS
# $@ : $< ... refers to just the first item

output/executables/print_name : code/print_name.c output/libraries/libpretty.a interfaces/pretty.h
	# print_name out of date. Compiling source file against library...
	gcc -o $@ code/print_name.c -Iinterfaces/ -Loutput/libraries -lpretty

# libpretty

output/objects/print_rjust.o : libraries/pretty/print_rjust.c
	# rjust.o out of date. Compiling source file...
	gcc -o $@ -c libraries/pretty/print_rjust.c

output/objects/print_colourful.o : libraries/pretty/print_colourful.c interfaces/pretty.h
	# colourful.o out of date. Compiling source file...
	gcc -o $@ -c libraries/pretty/print_colourful.c -Iinterfaces/

output/libraries/libpretty.a : output/objects/print_colourful.o output/objects/print_rjust.o
	# libpretty out of date. Combining objects...
	ar cr $@ output/objects/print_colourful.o output/objects/print_rjust.o

# libsimclist

output/objects/simclist.o : libraries/simclist/simclist.c interfaces/simclist.h
	# simclist.o out of date. Compiling source file...
	gcc -o $@ -c libraries/simclist/simclist.c -Iinterfaces/

output/libraries/libsimclist.a : output/objects/simclist.o
	# libsimclist out of date. Combining objects...
	ar cr $@ output/objects/simclist.o

# utilities
.PHONY: clean
clean:
	# removing output directory...
	rm -rf output
	make --no-print-directory directories

.PHONY: directories
directories:
	# creating directory structure
	mkdir -p output/{executables,libraries,objects}