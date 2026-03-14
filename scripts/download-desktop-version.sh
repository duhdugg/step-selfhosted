#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
cd "$SCRIPT_DIR/../build"
set -euxo pipefail

BASE_URL="https://downloads.stepbible.com/file/Stepbible"
FILENAME="stepbible_$DESKTOPVERSION.deb"
DOWNLOAD_URL="$BASE_URL/$FILENAME"

if [ ! -e stepbible.deb ]; then
  wget "$DOWNLOAD_URL" -O stepbible.deb
else
  echo "WARN: stepbible.deb already exists"
fi
