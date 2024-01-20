PLATFORMFLAG = --platform linux/x86_64
CONTAINER_NAME = cake_ubuntu_container

.PHONY: all
all:

.PHONY: build
build: 
	docker build $(PLATFORMFLAG) -t cake_ubuntu .

.PHONY: clear
clear:
	docker rmi cake_ubuntu

.PHONY: create
create:
	docker create -it -v ${PWD}:/mount --name ${CONTAINER_NAME} cake_ubuntu

.PHONY: start
start:
	# sequence
	# 1. start container
	# 2. login, do something
	docker start ${CONTAINER_NAME}
	docker exec -it ${CONTAINER_NAME} /bin/bash

.PHONY: stop
stop:
	docker stop ${CONTAINER_NAME}

.PHONY: rm
rm:
	docker stop ${CONTAINER_NAME}
	docker rm ${CONTAINER_NAME}

.PHONY: login
login:
	# sequence
	# 1. create container
	# 2. start container
	# 3. login, do something, logout
	# 4. remove container
	docker run --rm $(PLATFORMFLAG) -it -v ${PWD}:/mount cake_ubuntu /bin/bash