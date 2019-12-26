# ====================================================================== #
# Android SDK Docker Image. (Customer by lchy0113)
# ====================================================================== #

# Base image
# ====================================================================== #
FROM ubuntu:16.04

# Author
# ====================================================================== #
LABEL maintainer "lchy0113@gmail.com"

# install Java
RUN mkdir /root/Develop

RUN apt-get -y update
RUN apt-get -y install uuid uuid-dev 
RUN apt-get -y install zlib1g-dev liblz-dev 
RUN apt-get -y install liblzo2-2 liblzo2-dev 
RUN apt-get -y install lzop
RUN apt-get -y install git-core curl
RUN apt-get -y install u-boot-tools
RUN apt-get -y install mtd-utils
RUN apt-get -y install android-tools-fsutils
RUN apt-get -y install openjdk-8-jdk
RUN apt-get -y install device-tree-compiler
RUN apt-get -y install gdisk
RUN apt-get -y install make
RUN apt-get -y install gcc
