#!/usr/bin/env bash

set -euxo pipefail

apt install -y sudo
echo 'step   ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers;
