#!/usr/bin/env bash

set -euxo pipefail

# update base OS
apt update
apt upgrade -y

# install dependencies
apt install -y xvfb libxtst6 libxi6 fontconfig

# install step desktop
dpkg -i /ctx/stepbible.deb

# install run script
cp /ctx/run-step.sh /usr/local/bin/
chmod +x /usr/local/bin/run-step.sh

# setup step user
useradd -m step
# bash /ctx/setup-sudo.sh
