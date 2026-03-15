#!/usr/bin/env bash

set -euxo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
cd "$SCRIPT_DIR"
source ./set-oci-engine.sh
cd "$SCRIPT_DIR/../oci"

$OCI_ENGINE save -o ../build/step-selfhosted.tar step-selfhosted:latest
cd ../build
gzip step-selfhosted.tar
