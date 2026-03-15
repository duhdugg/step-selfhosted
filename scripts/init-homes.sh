#!/usr/bin/env bash

set -euxo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
cd "$SCRIPT_DIR"
source ./set-oci-engine.sh
cd "$SCRIPT_DIR/.."

rm -r ./data/homes || echo ''
mkdir -p ./data/homes
chmod -R 0777 ./data/homes
$OCI_ENGINE run --rm --name step-init-homes --volume ./data/homes:/homes:Z -it step-selfhosted bash -c "sudo cp -r /opt/step/homes/* /homes/"
cd ./data/homes
find -type d -exec chmod 0777 {} \;
