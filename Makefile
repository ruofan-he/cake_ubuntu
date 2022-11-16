PLATFORMFLAG = --platform linux/x86_64

.PHONY: all
all:

.PHONY: build
build: 
	docker build $(PLATFORMFLAG) -t cake_ubuntu .

.PHONY: clear
clear:
	docker rmi cake_ubuntu

.PHONY: login
login:
	docker run --rm $(PLATFORMFLAG) -it -v ${PWD}:/mount cake_ubuntu /bin/bash