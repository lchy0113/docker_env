#!/bin/bash

docker run -it  -v /home/lchy0113:/home/lchy0113 --privileged -v /dev/bus/usb:/dev/bus/usb -e LC_ALL=C.UTF-8 tcc8985:0.0
