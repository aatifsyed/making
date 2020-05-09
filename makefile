# LIBRARY_DIR = libraries/
# INTERFACE_DIR = interfaces/
# LIBRARY_OBJECTS = objects/libraries/
# EXECUTABLE_OBJECTS = objects/exectuables/

# libprint_colourful : $(INTERFACE_DIR)print_colourful.h $(LIBRARY_DIR)print_colourful.c
# 	# Make an object file
# 	gcc -o $(LIBRARY_OBJECTS)print_colourful.o -c -I$(INTERFACE_DIR) $(LIBRARY_DIR)print_colourful.c
# 	# Make that into an archive
# 	ar cr $(LIBRARY_OBJECTS)libprint_colourful.a $(LIBRARY_OBJECTS)print_colourful.o

libprint_colourful.a : objects/libraries/print_colourful.o
	ar cr objects/libraries/libprint_colourful.a objects/libraries/libprint_colourful.o

print_colourful.o 