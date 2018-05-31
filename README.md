Custom build of fluentd for use in kubernetes

Version is set by the `VERSION` file in the root of this repository.

## Plugins

* elasticsearch
* kubernetes_metadata_filter
* prometheus
* rewrite-tag-filter
* record-reformer
* systemd

## Build

Build the docker image locally.

    make build

## Release

Build the docker image locally, tag it with the `VERSION`, and push it to our GCR registry.

    make release
