#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
cd "$SCRIPT_DIR/../oci/ctx"
set -euxo pipefail

cp ../../build/stepbible.deb ./

cd ../step-build
cp ../../submodules/step/step-server/target/step-server-*.jar ./
cp -r ../../submodules/step/step-web/target/step-web ./
cd ./step-web
mv *.js js/
mv *.css css/
