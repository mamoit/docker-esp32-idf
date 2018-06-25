FROM ubuntu

WORKDIR /srv

ENV TOOLCHAIN_VERSION 1.22.0-80-g6c4433a-5.2.0
ENV IDF_VERSION v3.0.1

RUN mkdir project

RUN apt-get update && \
    apt-get install -y gcc git wget make libncurses-dev flex bison gperf python python-serial \
        bash-completion && \
    rm -rf /var/lib/apt/lists/* && \
    echo ". /etc/bash_completion" >> ~/.bashrc

RUN wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-$TOOLCHAIN_VERSION.tar.gz && \
    tar -xzf xtensa-esp32-elf-linux64-$TOOLCHAIN_VERSION.tar.gz && \
    rm -f xtensa-esp32-elf-linux64-$TOOLCHAIN_VERSION.tar.gz

RUN git clone --single-branch --depth=1 -b $IDF_VERSION --recursive https://github.com/espressif/esp-idf.git

ENV PATH=$PATH:/srv/xtensa-esp32-elf/bin
ENV IDF_PATH=/srv/esp-idf

VOLUME /srv/project

WORKDIR /srv/project

