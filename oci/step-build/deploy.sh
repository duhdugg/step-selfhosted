#!/usr/bin/env bash

set -euxo pipefail

cp -rT /step-build/step-web /opt/step/step-web
cp /step-build/step-server-*.jar /opt/step/

# FIXME dynamic version
rm /opt/step/step-server-26.1.2.jar
# if/when other things in step are modified, old jars need removed
# rm /opt/step/step-web/WEB-INF/lib/step-core-26.1.2.jar

sed --in-place 's/26.1.2/26.4.1/g' /opt/step/step-install4j
