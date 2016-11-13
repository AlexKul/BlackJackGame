#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

echo "Bootstrap: Installing Ruby v2.3.1"
rvm use 2.3.1 --default --install
rvm cleanup all

echo "Bootstrap: Installing bundler"
gem update > /dev/null
gem install bundler > /dev/null

echo "Bootstrap: Installing gems"
cd /vagrant
bundle
