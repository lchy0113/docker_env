## docker readme document.
=====

# docker compose example.
-----
```
version: '3'
# version : compose파일의 버전을 의미. 버전 3이 최신인 것을 확인 할 수 있다.

services:
# services : services 부터 실제 container 설정을 명시한다. 
		slave-i386:
		# slave-i386 : 사용자가 지정하는 이름. 지금은 이름은 slave-i386 라고 했지만 지정하고자 하는 다른 이름으로 변경해도 상관 없다. 

			container_name:	HN_jenkins_slave_i386
			image: ubuntu16.04.i386.jenkins_slave:latest
			# image : 해당 container가 어떤 image 를 기반으로 실행되는지 지정한다. 현재 옵션은  ubuntu16.04.i386.jenkins_slave:latest로부터 실행된다. 
			volumes:
				~/home/hdd/vm_opt:/opt
				~/home/hdd/work:/home/buildadmin/work
				~/tftpboot:/tftpboot
			# volumes : container와 host간의 공유할 디렉토리를 지정한다. 
			port:
				- "9022:22"
			# port : container와 host간의 공유할 포트를 지정한다.
			environment:
				- TZ=Asia/Seoul
			stdin_open:	true
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

