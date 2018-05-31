export NAME := fluentd
export GCR_REPO := gcr.io/sightmachine-178216
export VERSION := $(shell cat VERSION)

IMAGE := $(NAME):$(VERSION)

# ==============
# DEFAULT TARGET
# ==============
all: build

.PHONY: build
build:
	@docker build -t $(IMAGE) .

.PHONY: release
release: build
	@docker tag $(IMAGE) $(GCR_REPO)/$(IMAGE)
	@docker push $(GCR_REPO)/$(IMAGE)
