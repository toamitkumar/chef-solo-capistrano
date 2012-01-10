#!/usr/bin/env bash

# Load required bootstrap methods
if [ -f "/etc/SuSE-release" ]; then
  VERSION=`cat /etc/SuSE-release | grep VERSION | sed s/VERSION\ =\ //`
  case "$VERSION" in
    10)
      ruby_version="ree"
    ;;
    11)
      ruby_version="ruby_1_9_2_p290"
    ;;
  esac
fi

bootstraps="base_packages git ${ruby_version} chef chef_solo bundler"
for i in $bootstraps; do source bootstraps/$i.sh; done

# Run bootstrap in tmp directory
if [ -d /tmp/bootstrap ]; then
  echo "/tmp/bootstrap directory already exists"
else
  mkdir -p /tmp/bootstrap
  pushd /tmp/bootstrap
    for i in $bootstraps; do
      "bootstrap_$i"
      echo
    done
  popd
fi