#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
cd "$SCRIPT_DIR/../oci"
set -euxo pipefail

podman save -o ../build/step-selfhosted.tar step-selfhosted:latest
cd ../build
gzip step-selfhosted.tar
