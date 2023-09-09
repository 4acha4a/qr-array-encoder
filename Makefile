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
OUTPUT = qr-bmp

all: $(OUTPUT)

$(OUTPUT): $(SRC)
	$(CC) $(CFLAGS) $(SRC) $(SRC_QUIRC) -o $(OUTPUT) $(LIBS)

clean:
	rm -f $(OUTPUT)

test:
	./image-to-grayscale.py qrcode.png > qrcode_600x600_grayscale.bin
	./qr-bmp qrcode_600x600_grayscale.bin


.PHONY: all clean
