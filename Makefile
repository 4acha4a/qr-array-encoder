# Makefile for compiling qr-bmp.c

# Compiler
CC = gcc

# Compiler flags
CFLAGS = -g -I./quirc/lib

# Libraries
LIBS = -L/usr/local/lib

# Source file
SRC = qr-bmp.c
SRC_QUIRC =./quirc/lib/quirc.c ./quirc/lib/identify.c ./quirc/lib/decode.c ./quirc/lib/version_db.c

# Output executable
OUTPUT = main

all: $(OUTPUT)

$(OUTPUT): $(SRC)
	$(CC) $(CFLAGS) $(SRC) $(SRC_QUIRC) -o $(OUTPUT) $(LIBS)

clean:
	rm -f $(OUTPUT)

test:


.PHONY: all clean
