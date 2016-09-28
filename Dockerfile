FROM ubuntu:xenial

RUN echo "deb http://archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y install fio iozone3 postmark build-essential make gcc wget && \
    mkdir /usr/local/fsx && \
    wget -O /usr/local/fsx/fsx.c https://raw.githubusercontent.com/linux-test-project/ltp/master/testcases/kernel/fs/fsx-linux/fsx-linux.c && \
    make /usr/local/fsx/fsx && \
    wget -O /tmp/pjd-fstest-20080816.tgz http://tuxera.com/sw/qa/pjd-fstest-20080816.tgz && \
    cd /usr/local && tar zxvf /tmp/pjd-fstest-20080816.tgz && rm /tmp/pjd-fstest-20080816.tgz && \
    make -C /usr/local/pjd-fstest-20080816 all && \
    rm -rf /var/lib/apt/lists/*
