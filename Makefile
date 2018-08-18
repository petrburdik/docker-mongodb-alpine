VERSION = 0.5.0
IMAGE = petrburdik/docker-mongodb-alpine:$(VERSION)

all:

image:
    docker build -t $(IMAGE) --no-cache .

publish:
    docker push $(IMAGE)
