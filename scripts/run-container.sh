#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
cd "$SCRIPT_DIR/.."
set -euxo pipefail

podman run --rm -p 8989:8989 --name step-selfhosted --volume ./data/homes:/opt/step/homes:Z -it step-selfhosted
