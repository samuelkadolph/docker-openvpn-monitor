DOCKER_IMAGE ?= samuelkadolph/openvpn-monitor

BUILD_DATE ?= `date -u +"%Y-%m-%dT%H:%M:%SZ"`
VCS_REF ?= `git rev-parse --short HEAD`

default: build

build:
	docker build --build-arg $(BUILD_DATE) --build-arg $(VCS_REF) --tag $(DOCKER_IMAGE) .

.PHONY: build
