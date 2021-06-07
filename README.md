This is a simple Amiga vbcc cross compilation project template for vscode. Might be useful for other people playing around
with Amiga C development so I figured I might as well put it in a public github repo and that also forces me to document things for my self. **Notice: I have only tested this on linux**

## Prerequirements

1. You need to install vbcc http://sun.hasenbraten.de/vbcc/
2. You need to install NDK https://www.haage-partner.de/download/AmigaOS/NDK39.lha
3. You need to install fs-uae https://fs-uae.net/
4. You need to install `socat` to get serial debugging working
5. You need to setup an environment variable `NDK_INC` that should point to `<ndk installation>/include_h`
6. You need to setup an environment variable `NDK_LIB` that should point to `<ndk installation>/linker_libs`
7. You need to add `<vbcc installation>/bin` to you environment PATH variables
8. Recommended to install `C/C++ for Visual Studio Code` for better editor support
9. Recommended to install `Amiga Assembly` to be able to syntax check assembly files

## What this template includes

* Compile and run mixed Amiga C/Assembly projects on fs-uae with a push of a button
* Nested dirs in the src
* Local syntax checking of both C and Assembly
* Clang autoformat settings
* FS-UAE local settings
* Pipe debug messages from the Amiga though the serial port to a local terminal
* Editor config to normalize tabs and newlines

## Bulding and running the program in fs-uae

`make` or `make build run`

## Building

`make build`

## Run the program in fs-uae

`make run`

## Start serial debug console

`make debuglog`

## Clean the build artifacts

`make clean`
