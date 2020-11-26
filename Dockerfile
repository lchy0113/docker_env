# ====================================================================== #
# Android SDK Docker Image. (Customer by lchy0113)
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
	openjdk-8-jdk \
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
	mtd-utils	\
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
	cpio \
	locales \
	mkisofs \
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
	python \
	software-properties-common \
	figlet	\
	openssh-server \
	gawk \
	busybox \
	ctags	\
	cscope
	
# Sets Language to UTF8 : this works in pretty much all cases
RUN	locale-gen en_US.UTF-8
ENV	LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# Add update source warehouse
#RUN apt-add-repository -y ppa:openjdk-r/ppa

# Update apt-get
#RUN apt-get -y update

# Installing packages
#RUN apt-get -y install \
#		openjdk-8-jdk

#RUN mkdir -p /var/run/sshd

RUN adduser --disabled-password -gecos "" lchy0113 \
		&& echo 'lchy0113:lchy0113' | chpasswd \
		&& adduser lchy0113 sudo \
		&& echo 'lchy0113 ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
		&& mkdir /var/run/sshd

WORKDIR /home/$(whoami)/

#RUN	sed -i 's/AcceptEnv LANG LC_*/#AcceptEnv LANG LC_*/g' /etc/ssh/sshd_config
#RUN	sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
#RUN	sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN export USER=$(whoami)

EXPOSE 22

CMD	["/usr/sbin/sshd", "-D"]

