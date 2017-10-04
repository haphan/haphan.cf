.PHONY: all build push deploy

IMAGE = haphan/haphan-cf
INSTANCE = haphan-cf-default
VERSION := $(shell date '+%y%m%d.%H%M%S')

default: build push

build:
	hugo
	docker build --tag $(IMAGE):latest --tag $(IMAGE):$(VERSION) .

push:
	docker push $(IMAGE):latest
	docker push $(IMAGE):$(VERSION)

run:
	-docker rm -f $(INSTANCE)
	docker run -it -d  -p 8080:80 --name $(INSTANCE) $(IMAGE):latest
	echo "Site is up at: http://localhost:8080/"
rm:
	-docker rm -f $(INSTANCE)
sh:
	docker exec -it $(INSTANCE) sh

log:
	docker logs -f $(INSTANCE)

bootstrap:
	ansible-galaxy -r ansible/requirements.yml install
	ansible-playbook -v ansible/bootstrap.coreos.yml

deploy:
	ansible-playbook -v ansible/deploy.yml
