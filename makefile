SHELL = bash # for expansion

CC = gcc
CFLAGS = -I$(INT_SRC) -L$(LIB_DIR)

SRC = code/
INT_SRC = interfaces/
LIB_SRC = libraries/

EXE_DIR = output/executables/
LIB_DIR = output/libraries/
OBJ_DIR = output/objects/

# $@ : $^     refers to all of the RHS
# $@ : $< ... refers to just the first item

print_name : $(EXE_DIR)print_name

$(EXE_DIR)print_name : $(SRC)print_name.c $(LIB_DIR)libpretty.a $(INT_SRC)pretty.h
	# print_name out of date. Compiling source file against library...
	gcc -o $@ $(SRC)print_name.c $(CFLAGS) -lpretty

# libpretty

$(OBJ_DIR)print_rjust.o : $(LIB_SRC)pretty/print_rjust.c
	# rjust.o out of date. Compiling source file...
	gcc -o $@ -c $(LIB_SRC)pretty/print_rjust.c

$(OBJ_DIR)print_colourful.o : $(LIB_SRC)pretty/print_colourful.c $(INT_SRC)pretty.h
	# colourful.o out of date. Compiling source file...
	gcc -o $@ -c $(LIB_SRC)pretty/print_colourful.c $(CFLAGS)

$(LIB_DIR)libpretty.a : $(OBJ_DIR)print_colourful.o $(OBJ_DIR)print_rjust.o
	# libpretty out of date. Combining objects...
	ar cr $@ $(OBJ_DIR)print_colourful.o $(OBJ_DIR)print_rjust.o

# libsimclist

$(OBJ_DIR)simclist.o : $(LIB_SRC)simclist/simclist.c $(INT_SRC)simclist.h
	# simclist.o out of date. Compiling source file...
	gcc -o $@ -c $(LIB_SRC)simclist/simclist.c $(CFLAGS)

$(LIB_DIR)libsimclist.a : $(OBJ_DIR)simclist.o
	# libsimclist out of date. Combining objects...
	ar cr $@ $(OBJ_DIR)simclist.o

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