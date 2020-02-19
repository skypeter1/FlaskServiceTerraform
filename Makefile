cnf ?= config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

docker-run:
		@echo "Builds the docker container and runs the service"	
		docker build -t $(DOCKER_REPO):$(DOCKER_TAG) --no-cache .
		docker run -i -t --rm -p $(PORT):$(PORT) --name=$(MYAPP) $(DOCKER_REPO):$(DOCKER_TAG)