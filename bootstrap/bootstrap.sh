#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

export DEBIAN_FRONTEND=noninteractive

echo "Bootstrap: Updating packages"
apt-get update > /dev/null 2>&1

echo "Bootstrap: Installing curl"
apt-get install -y curl > /dev/null 2>&1

echo "Installing Node.js"
apt-get install -y nodejs > /dev/null 2>&1
