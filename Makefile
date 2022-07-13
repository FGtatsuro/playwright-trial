.PHONY: docker/build docker/clean

DOCKER_TAG := playwright-trial:latest
CONTAINER_NAME := playwright-trial

DEPENDENCIES := \
		main.spec.ts \
		package.json

.docker_build: $(DEPENDENCIES)
	docker build -t $(DOCKER_TAG) .
	touch .docker_build

docker/build: .docker_build

docker/run:
	if [ -z "`docker ps -a | grep $(CONTAINER_NAME)`" ]; then \
		docker run -it --rm --ipc=host --name $(CONTAINER_NAME) $(DOCKER_TAG); \
	fi

docker/rm:
	if [ -n "`docker ps -a | grep $(CONTAINER_NAME)`" ]; then \
		docker rm $(CONTAINER_NAME); \
	fi

docker/clean:
	rm -f .docker_build
