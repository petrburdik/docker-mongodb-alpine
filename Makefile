VERSION = 1.0.0
IMAGE = petrburdik/mongodb-alpine:$(VERSION)

all:

image:
    docker build -t $(IMAGE) --no-cache .

publish:
    docker push $(IMAGE)
