FROM marklee77/ubuntu-trusty-vagrantbox:latest
MAINTAINER Mark Stillwell <mark@stillwell.me>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install \
      build-essential \
      flex \
      gawk \
      gcc-multilib \
      gettext \
      git \
      libncurses5-dev \
      python \
      subversion \ 
      unzip \
      wget \
      zlib1g-dev && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

WORKDIR /home/vagrant
ENV HOME /home/vagrant
USER vagrant
RUN git clone git://git.openwrt.org/14.07/openwrt.git
RUN cd openwrt && \
    ./scripts/feeds update -a  && \
    ./scripts/feeds install -a && \
    make defconfig && \
    make prereq
