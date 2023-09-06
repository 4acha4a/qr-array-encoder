# Makefile for compiling qr-bmp.c

# Compiler
CC = gcc

# Compiler flags
CFLAGS = -g

# Libraries
LIBS = -L/usr/local/lib -lquirc

# Source file
SRC = qr-bmp.c

# Output executable
OUTPUT = main

all: $(OUTPUT)

$(OUTPUT): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(OUTPUT) $(LIBS)

clean:
	rm -f $(OUTPUT)

.PHONY: all clean
