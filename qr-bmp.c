#include <quirc.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

const int WIDTH = 600;
const int HEIGHT = 600;
const int BUFFER_SIZE = WIDTH*HEIGHT;

int main(int argc, char **argv) {

    // initialize QR
    struct quirc *qr;

    qr = quirc_new();
    if (!qr) {
        perror("Failed to allocate memory");
        abort();
    }

    if (quirc_resize(qr, WIDTH, HEIGHT) < 0) {
        perror("Failed to allocate video memory");
        abort();
    }
 
    uint8_t *image;
    int w, h;
    image = quirc_begin(qr, &w, &h); 

    // get data from input
    fread(image, BUFFER_SIZE, 1, stdin);

    // create QR
    quirc_end(qr);

    // decode QR
    int num_codes;
    num_codes = quirc_count(qr);
    for (size_t i = 0; i < num_codes; i++) {
        struct quirc_code code;
        struct quirc_data data;
        quirc_decode_error_t err;

        quirc_extract(qr, i, &code);

        /* Decoding stage */
        err = quirc_decode(&code, &data);
        if (err)
            printf("DECODE FAILED: %s\n", quirc_strerror(err));
        else
            printf("Data: %s\n", data.payload); // print decoded data
    }
    quirc_destroy(qr);
}
