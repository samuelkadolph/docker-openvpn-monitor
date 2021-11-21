BUILD_DATE ?= `date -u +"%Y-%m-%dT%H:%M:%SZ"`
IMAGE_NAME ?= samuelkadolph/openvpn-monitor:latest
VCS_REF ?= `git rev-parse --short HEAD`

default: build

build:
	docker buildx build --platform linux/amd64 --build-arg BUILD_DATE=$(BUILD_DATE) --build-arg VCS_REF=$(VCS_REF) --secret id=MAXMIND_LICENSE_KEY --tag $(IMAGE_NAME) .
.PHONY: build

publish:
	docker push $(IMAGE_NAME)
.PHONY: publish
