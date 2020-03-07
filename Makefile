DOCKER_TAG := "akiray03/stretch-ffmepg-and-gcloud"

.PHONY: build
build:
	docker build . -t ${DOCKER_TAG}

.PHONY: push
push: build
	docker push ${DOCKER_TAG}