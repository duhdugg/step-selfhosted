#!/usr/bin/env bash

set -euxo pipefail

cp -rT /step-build/step-web /opt/step/step-web
cp /step-build/step-server-*.jar /opt/step/

# FIXME dynamic version
rm /opt/step/step-server-26.1.2.jar
# when java in step is modified after the desktop release, old jars need removed
rm /opt/step/step-web/WEB-INF/lib/step-core-26.1.2.jar

sed --in-place 's/26.1.2/26.5.2/g' /opt/step/step-install4j
