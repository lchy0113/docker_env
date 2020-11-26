# ====================================================================== #
# Android SDK Docker Image. (Customer by lchy0113)
# ====================================================================== #


# Base image
# ====================================================================== #
FROM ubuntu:16.04

# Author
# ====================================================================== #
LABEL maintainer "lchy0113@gmail.com"


# Sets Language to UTF8 : this works in pretty much all cases
#ENV LANG en_US.UTF-8
#RUN locale-gen $LANG

# Update apt-get
RUN apt-get -y update

# Installing packages
RUN apt-get -y install \
		uuid 	\
		uuid-dev	\
		zlib1g-dev	\
		liblz-dev	\
		liblzo2-2	\
		liblzo2-dev	\
		lzop	\
		git-core	\
		curl	\
		u-boot-tools	\
		python	\
		mtd-utils	\
		openjdk-8-jdk	\
		device-tree-compiler	\
		gdisk	\
		make	\
		gcc	\
		bc	\
		m4 	\
		ccache	\
		zip	\
		unzip	\
		gnupg	\
		flex	\
		bison	\
		gperf	\
		build-essential	\
		gcc-multilib	\
		g++-multilib	\
		libc6-dev-i386	\
		lib32ncurses5-dev	\
		x11proto-core-dev	\
		libx11-dev	\ 
		lib32z-dev	\
		libgl1-mesa-dev	\
		libxml2-utils	\
		xsltproc	\
		vim	\
		usbutils	\
		sudo	\
		ctags	\
		cscope	\
		openssh-server \
		locales	\
		figlet \
		repo

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN adduser --disabled-password -gecos "" lchy0113 \
		&& echo 'lchy0113:lchy0113' | chpasswd \
		&& adduser lchy0113 sudo \
		&& echo 'lchy0113 ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
		&& mkdir /var/run/sshd

WORKDIR /home/$(whoami)/

EXPOSE 22

RUN export USER=$(whoami)

CMD ["/usr/sbin/sshd", "-D"]
