FROM ubuntu

WORKDIR /srv

RUN mkdir project

RUN apt-get update && \
    apt-get install -y gcc git wget make libncurses-dev flex bison gperf python python-serial && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && \
    tar -xzf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && \
    rm -f xtensa-esp32-elf-linux64-1.22.0-61-gab8375a-5.2.0.tar.gz

RUN git clone --depth=1 --recursive https://github.com/espressif/esp-idf.git

ENV PATH=$PATH:/srv/xtensa-esp32-elf/bin
ENV IDF_PATH=/srv/esp-idf

VOLUME /srv/project

WORKDIR /srv/project

