# Docker container for esp32 development

This project is meant to ease the developmet for the esp32, containing the
development tools all in one docker image, keeping your system clean.

## Dependencies
That's the beauty of it, you just need `docker`.

Ok...
If you want to use the Makefile you'll actually need `make`.

## Instructions
Copy your project to the project folder, and run:
```
make shell
```
in this project's top directory.
The docker image will be built (if it is not built yet) and you will be
presented with a bash running inside the container, from there, you'll just
need to run your `make` to build your project.

If you don't have a project, run the `make shell` command and simply copy one
of the examples from the example folder and start from there:
```
cp -r ../esp-idf/examples/get-started/hello_world/* ./
```
for example.

## References
This image is based on the instructions described [here](https://esp-idf.readthedocs.io/en/latest/get-started/linux-setup.html).

