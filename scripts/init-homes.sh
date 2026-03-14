#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
cd "$SCRIPT_DIR/.."
set -euxo pipefail

rm -r ./data/homes || echo ''
mkdir -p ./data/homes
chmod -R 0777 ./data/homes
# FIXME: remove :Z for non-SELinux
podman run --rm --name step-init-homes --volume ./data/homes:/homes:Z -it step-selfhosted bash -c "sudo cp -r /opt/step/homes/* /homes/"
cd ./data/homes
find -type d -exec chmod 0777 {} \;
