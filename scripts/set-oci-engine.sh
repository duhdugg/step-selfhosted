#!/usr/bin/env bash

# Save current exit-on-error state
case $- in
    *e*) restore_e="set -e" ;;
    *)   restore_e="set +e" ;;
esac

# Temporarily disable exit-on-error
set +e

OCI_ENGINE=podman
if podman images | grep step-selfhosted; then
  true
elif docker images | grep step-selfhosted; then
  OCI_ENGINE="docker"
else
  OCI_ENGINE="sudo docker"
fi

# Restore original exit-on-error state
$restore_e
