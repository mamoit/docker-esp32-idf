.PHONY: all docker shell

all: shell

docker:
	docker build docker -t esp32

shell: docker
	docker run --rm -it --device=/dev/ttyUSB0 --volume /etc/localtime:/etc/localtime:ro --volume `pwd`/project:/srv/project esp32 bash

builder: docker
	docker run --rm -it --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro --volume `pwd`/project:/srv/project esp32 bash

