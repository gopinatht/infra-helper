appname = infra-helper
docker_repo = gopinatht
docker_tag = latest
application_directory = infra-helper

all: push

build:
	GOOS=linux go build -o ./bin/$(appname) ./$(application_directory)

image: build
	docker build -t $(appname):$(docker_tag) .

tag: image
	docker tag $(appname):$(docker_tag) $(docker_repo)/$(appname):$(docker_tag)

push: tag
	docker push $(docker_repo)/$(appname):$(docker_tag)
