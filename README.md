## docker readme document.
=====

# docker 권한
-----
docker 는 root 권한이 기본적으로 필요하다. 그래서 sudo 없이 사용하기 위해서 다음과 같이 사용자를 docker그룹에 추가한다.
```
$ sudo usermod -aG docker $USER # 현재 접속중인 사용자에게 권한주기
$ sudo usermod -aG docker your-user # your-user 사용자에게 권한주기
```

# Ubuntu 16.04 docker 이미지 다운받기.
-----
docker 이미지를 받기위해서는 run 명령어나 pull 명령어로 받을 수 있다. 
또한 run 명령어는 해당 이미지가 없다면 자동으로 다운받아 실행시킨다.
```
$ docker run ubuntu:16:04
```

- 다운받은 이미지 확인하기.
```
$ docker images 
```

- 도커 이미지 실행시키기.
```
$ docker run --restart always --name [컨테이너의 이름] -dt ubuntu:16:04
```

- 실행중인 도커 확인하기.
```
$ docker ps
```

- 실행중인 컨테이너 내부로 들어가기.
```
$ docker exec -it [들어갈 컨테이너 이름 혹은 ID] /bin/bash
```


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
