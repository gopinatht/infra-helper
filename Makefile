appname = infra_helper
docker_repo = gopinatht
docker_tag = latest

all: push

build:
	GOOS=linux go build -o ./$(appname) .

image: build
	docker build -t $(appname):$(docker_tag).

tag: image
	docker tag $(appname):$(docker_tag) $(docker_repo)/$(appname):$(docker_tag)

push: tag
	docker push $(docker_repo)/$(appname):$(docker_tag)
