FROM ubuntu as cloner

RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

ENV IDF_VERSION v3.3

RUN cd /srv && \
    git clone --single-branch --depth=1 -b $IDF_VERSION --recursive https://github.com/espressif/esp-idf.git && \
    rm -rf /srv/esp-idf/.git

FROM python:3-slim

WORKDIR /srv

RUN mkdir project && \
    useradd -c 'IDF' -m -d /srv/project -s /bin/bash idf && \
    chown -R idf:idf /srv/project && \
    adduser idf dialout

VOLUME /srv/project

RUN apt-get update && \
    apt-get install -y gcc git wget make libncurses-dev flex bison gperf python python-serial \
        bash-completion cmake && \
    rm -rf /var/lib/apt/lists/* && \
    echo ". /etc/bash_completion" >> ~/.bashrc

ENV TOOLCHAIN_VERSION 1.22.0-80-g6c4433a-5.2.0

RUN wget -nv https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-$TOOLCHAIN_VERSION.tar.gz && \
    tar -xzf xtensa-esp32-elf-linux64-$TOOLCHAIN_VERSION.tar.gz && \
    rm -f xtensa-esp32-elf-linux64-$TOOLCHAIN_VERSION.tar.gz

COPY --from=cloner /srv/esp-idf ./esp-idf

RUN pip install --no-cache-dir -r ./esp-idf/requirements.txt

USER idf

ENV PATH=$PATH:/srv/xtensa-esp32-elf/bin:/srv/esp-idf/tools
ENV IDF_PATH=/srv/esp-idf

WORKDIR /srv/project
