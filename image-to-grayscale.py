#!/usr/bin/env python3
from PIL import Image
import sys

def image_to_grayscale_array(image_path):
    # Open the image file
    with Image.open(image_path) as img:
        # Convert image to grayscale
        grayscale_img = img.convert('L')
        grayscale_img = grayscale_img.resize((600, 600))
        
        # Get image data as a list of lists (2D array)
        img_data = list(grayscale_img.getdata())
        grayscale_array = [img_data[n:n+grayscale_img.width] for n in range(0, len(img_data), grayscale_img.width)]
        
        return grayscale_array

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: ./image_to_grayscale_array.py <path_to_image>")
        sys.exit(1)

    image_path = sys.argv[1]
    grayscale_array = image_to_grayscale_array(image_path)

    bytesArr = bytearray()

    # TODO: Print this array as binary
    for i in range(len(grayscale_array)):
        for j in range(len(grayscale_array[i])):
            byte = grayscale_array[i][j]
            bytesArr.append(byte)
        
    binary_data = bytes(bytesArr)

    # Write binary data to stdout
    sys.stdout.buffer.write(binary_data)