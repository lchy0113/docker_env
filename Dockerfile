# ====================================================================== #
# Android SDK Docker Image. (Project NHN1033)
# ====================================================================== #


# Base image
# ====================================================================== #
FROM ubuntu:16.04

# Author
# ====================================================================== #
LABEL maintainer "lchy0113@gmail.com"


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
	locales
	
# Sets Language to UTF8 : this works in pretty much all cases
RUN LANGUAGE=ko_KR.UTF-8 LANG=ko_KR.UTF-8 locale-gen ko_KR ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV LANG ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8


RUN mkdir -p /var/run/sshd

RUN adduser --disabled-password -gecos "" lchy0113 \
		&& echo 'lchy0113:lchy0113' | chpasswd \
		&& adduser lchy0113 sudo \
		&& echo 'lchy0113 ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 

RUN adduser -u 1005 --disabled-password -gecos "" yschoi \
		&& echo 'yschoi:yschoi' | chpasswd \
		&& adduser yschoi sudo \
		&& echo 'yschoi ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 

# replace sshd_config
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
