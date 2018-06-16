FROM ubuntu:artful 

MAINTAINER Dobin Rutishauser version: 0.1

RUN apt-get update && \
    apt-get install -y curl git wget clang gdb python python-pip binutils-dev libunwind-dev clang iproute2 && \
    git clone https://github.com/dobin/ffw.git && \
    ( cd ffw && git checkout fenrir ) && \
    ( cd ffw && pip install -r requirements.txt ) && \
    ( cd ffw && git clone https://github.com/aoh/radamsa.git && cd radamsa && make ) && \
    ( cd ffw && git clone https://github.com/dobin/honggfuzz && cd honggfuzz && git checkout master && make ) && \
    ( cd / && git clone https://github.com/dobin/ffw-examples.git ) && \
    ( mkdir /Development; ln -s /ffw /Development/ffw; ln -s /ffw/honggfuzz /Development/honggfuzz; ln -s /ffw-examples /Development/ffw-examples )

WORKDIR /ffw

CMD /bin/bash 
