#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
cd "$SCRIPT_DIR/../build"
set -euxo pipefail

sha256sum stepbible.deb | grep "$DESKTOPCHECKSUM"

echo "verified"
