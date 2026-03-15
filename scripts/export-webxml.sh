#!/usr/bin/env bash

set -euxo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
cd "$SCRIPT_DIR"
source ./set-oci-engine.sh
cd "$SCRIPT_DIR/.."

$OCI_ENGINE run --rm -it step-selfhosted cat /opt/step/step-web/WEB-INF/web.xml > "data/web.xml"
