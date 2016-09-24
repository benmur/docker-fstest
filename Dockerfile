FROM ubuntu:xenial

RUN echo "deb http://archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y install fio iozone3 postmark build-essential make gcc wget && \
    mkdir /usr/local/fsx && \
    wget -O /usr/local/fsx/fsx.c https://raw.githubusercontent.com/linux-test-project/ltp/master/testcases/kernel/fs/fsx-linux/fsx-linux.c && \
    make /usr/local/fsx/fsx && \
    rm -rf /var/lib/apt/lists/*
