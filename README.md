## docker readme document.
=====

# docker compose example.
-----
```
version: '3'
# version : compose파일의 버전을 의미. 버전 3이 최신인 것을 확인 할 수 있다.

services:
# services : services 부터 실제 container 설정을 명시한다. 
		slave-amd64:
		# slave-amd64: 사용자가 지정하는 이름. 지금은 이름은 slave-i386 라고 했지만 지정하고자 하는 다른 이름으로 변경해도 상관 없다. 

			container_name: Android_Develop
			image: tcc8985:0.0
			# image : 해당 container가 어떤 image 를 기반으로 실행되는지 지정한다. 현재 옵션은  image: tcc8985:0.0 로부터 실행된다. 
			stdin_open:	true
			volumes:
				- /home/lchy0113:/home/lchy0113
				- /dev/bus/usb:/dev/bus/usb
				- /etc/localtime:/etc/localtime
			# volumes : container와 host간의 공유할 디렉토리를 지정한다. 
			port:
				- "9022:22"
			# port : container와 host간의 공유할 포트를 지정한다.
			environment:
				- TZ=Asia/Seoul
				- LC_ALL=C.UTF-8
```

# docker compose 실행 및 정지 명령어.
-----

* shell에서 실행.
```
$ docker-compose up
```

* 데몬으로 실행.
```
$ docker-compose up -d 
```

* 정지.
```
$ docker-compose down 
```

# container bash 접근.
-----
```
docker exec -it Android_Develop bash
```