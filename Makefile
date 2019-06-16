BUILD_DATE ?= `date -u +"%Y-%m-%dT%H:%M:%SZ"`
IMAGE_NAME ?= samuelkadolph/openvpn-monitor:latest
VCS_REF ?= `git rev-parse --short HEAD`

default: build

build:
	docker build --build-arg $(BUILD_DATE) --build-arg $(VCS_REF) --tag $(IMAGE_NAME) .

.PHONY: build
