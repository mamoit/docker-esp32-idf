DOCKER_USERNAME ?= mamoit

.PHONY: all docker shell

all: shell

docker:
	docker build docker -t $(DOCKER_USERNAME)/esp32

publish: docker
	@echo "$(DOCKER_PASSWORD)" | docker login -u "$(DOCKER_USERNAME)" --password-stdin
	docker push $(DOCKER_USERNAME)/esp32

shell: docker
	docker run --rm -it --device=/dev/ttyUSB0 --volume /etc/localtime:/etc/localtime:ro --volume `pwd`/project:/srv/project $(DOCKER_USERNAME)/esp32 bash

builder: docker
	docker run --rm -it --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro --volume `pwd`/project:/srv/project $(DOCKER_USERNAME)/esp32 bash

