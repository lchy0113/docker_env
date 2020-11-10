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
	locales	\
	repo
	
# Sets Language to UTF8 : this works in pretty much all cases
RUN LANGUAGE=ko_KR.UTF-8 LANG=ko_KR.UTF-8 locale-gen ko_KR ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV LANG ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8


RUN mkdir -p /var/run/sshd

RUN adduser -u 1000 --disabled-password -gecos "" lchy0113 \
		&& echo 'lchy0113:lchy0113' | chpasswd \
		&& adduser lchy0113 sudo \
		&& echo 'lchy0113 ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 

RUN adduser -u 1001 --disabled-password -gecos "" jkkim \
		&& echo 'jkkim:jkkim' | chpasswd \
		&& adduser jkkim sudo \
		&& echo 'jkkim ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 


RUN adduser -u 1002 --disabled-password -gecos "" ssyoo \
		&& echo 'ssyoo:ssyoo' | chpasswd \
		&& adduser ssyoo sudo \
		&& echo 'ssyoo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 

RUN adduser -u 1005 --disabled-password -gecos "" kbh88zz \
		&& echo 'kbh88zz:kbh88zz' | chpasswd \
		&& adduser kbh88zz sudo \
		&& echo 'kbh88zz ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 

RUN adduser -u 1007 --disabled-password -gecos "" syjeon \
		&& echo 'syjeon:syjeon' | chpasswd \
		&& adduser syjeon sudo \
		&& echo 'syjeon ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 




#############
# Install Jenkins.
# made from https://github.com/jenkinsci/docker/blob/83ce6f6070f1670563a00d0f61d04edd62b78f4f/Dockerfile
ENV JENKINS_HOME /home/working_space/jenkins_nhn1033 

# Jenkins is run with user `jenkins`, uid = 1002
# If you bind mount a volume from the host or a data container,
# ensure you use the same uid
# and change password for jenkins account.
RUN adduser --disabled-password --gecos "" jenkins \
		&& echo 'jenkins:jenkins' | chpasswd \
   		&& adduser jenkins sudo \
		&& echo 'jenkins ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN echo "jenkins:1234" | chpasswd

RUN mkdir -p /home/jenkins/.ssh/
RUN chown jenkins:jenkins -R /home/jenkins/

RUN mkdir -p /home/jenkins/tools
RUN mkdir -p /home/jenkins/bin
RUN PATH=/home/jenkins/bin:$PATH
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /home/jenkins/bin/repo
RUN chmod a+x /home/jenkins/bin/repo

# Register gerrit ssh key.
#RUN /home/jenkins/tools/kdiwin_nhn1033/kdone_RSA_PRIVATE.sh
# Jenkins home directory is a volume, so configuration and build history
# can be persisted and survive image upgrades
#VOLUME /home/working_space/jenkins_nhn1033
VOLUME "/tmp" "/run" "/var/run"


# replace sshd_config
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
