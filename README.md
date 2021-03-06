# Docker container for esp32 development

[![Build Status](https://travis-ci.org/mamoit/docker-esp32-idf.svg?branch=master)](https://travis-ci.org/mamoit/docker-esp32-idf)

This project is meant to ease the developmet for the esp32, containing the
development tools all in one docker image, keeping your system clean.

## Dependencies
That's the beauty of it, you just need `docker`.

Ok...
If you want to use the Makefile you'll actually need `make`.

## Instructions
Plug in your esp32 module to an USB port.

Copy your project to the project folder, and run:
```
make shell
```
in this project's top directory.
The docker image will be built (if it is not built yet) and you will be
presented with a bash running inside the container, from there, you'll just
need to build your project.

If you don't have a project, run the `make shell` command and simply copy one
of the examples from the example folder and start from there:
```
cp -r ../esp-idf/examples/get-started/hello_world/* ./
```
for example.

### Build your project with cmake
Because of timestamps and the way make stores temporary files outside the build directory, the best way to not rebuild your entire project every time you re-launch your container is to actually use cmake.
When you have a shell in the environment:

Configure the project
```
idf.py menuconfig
```

Build it
```
idf.py build
```

Flash it
```
idf.py -p /dev/ttyUSB0 flash
```

## References
This image is based on the instructions described [here](https://esp-idf.readthedocs.io/en/latest/get-started/linux-setup.html).
