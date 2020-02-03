#!/bin/bash

##############################
# Docker Script.
##############################

function help_fn()
{
		echo "------------------------------------------"
		echo "- run : start docker."
		echo "- build : generate docker image."
		echo "------------------------------------------"
}

case $1 in
	help)
		help_fn
		;;
	run)
		echo "------------------------------------------"
		echo "--> RUN"
		# docker exec -it Android_Develop bash
		docker run -it  -v /home/lchy0113:/home/lchy0113 --privileged -v /dev/bus/usb:/dev/bus/usb -v /etc/localtime:/etc/localtime:ro -e LC_ALL=C.UTF-8 tcc8985:0.0
		;;
	build)
		echo "------------------------------------------"
		echo "--> BUILD"
		docker build --tag tcc8985:0.0 .
		;;
esac
