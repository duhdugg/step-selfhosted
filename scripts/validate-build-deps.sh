#!/usr/bin/env bash

set -euxo pipefail

which git
which mvn
which podman || which docker
which buildah
which wget
which gzip
