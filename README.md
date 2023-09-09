# qr-array-encoder
Create QR Code from u8int_t 600x600 grayscale array 
To build the project, you must have quirc library installed

# Usage:
./image-to-grayscale.py qrcode.png > qrcode_600x600_grayscale.bin
./qr-bmp qrcode_600x600_grayscale.bin <br />

# Array structure
Standard Python-like 2D array of u8int_t: [[num1, num2, num3], [num4, num5, num6], ...]
