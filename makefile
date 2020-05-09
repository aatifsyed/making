output/executables/print_name : code/print_name.c output/libraries/libpretty.a
	# print_name out of date. Compiling source file against library...
	gcc -o output/executables/print_name code/print_name.c -Iinterfaces/ -Loutput/libraries -lpretty

output/objects/print_rjust.o : libraries/pretty/print_rjust.c
	# rjust.o out of date. Compiling source file...
	gcc -o output/objects/print_rjust.o -c libraries/pretty/print_rjust.c

output/objects/print_colourful.o : libraries/pretty/print_colourful.c
	# colourful.o out of date. Compiling source file...
	gcc -o output/objects/print_colourful.o -c libraries/pretty/print_colourful.c -Iinterfaces/

output/libraries/libpretty.a : output/objects/print_colourful.o output/objects/print_rjust.o
	# libpretty out of date. Combining objects...
	ar cr output/libraries/libpretty.a output/objects/print_colourful.o output/objects/print_rjust.o