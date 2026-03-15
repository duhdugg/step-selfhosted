#!/usr/bin/env bash

set -euxo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
cd "$SCRIPT_DIR"
source ./set-oci-engine.sh
cd "$SCRIPT_DIR/.."

$OCI_ENGINE run --rm -p 8989:8989 --name step-selfhosted --volume ./data/homes:/opt/step/homes:Z -it step-selfhosted
