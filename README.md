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

Test it:

    docker run fluentd:$VERSION

## Release

Build the docker image locally, tag it with the `VERSION`, and push it to our GCR registry.

    make release

Test it:

    docker run gcr.io/sightmachine-178216/fluentd:$VERSION
