.PHONY: all docker shell

all: shell

docker:
	docker build docker -t esp32

shell: docker
	docker run --rm -it --volume `pwd`/project:/srv/project esp32 bash

