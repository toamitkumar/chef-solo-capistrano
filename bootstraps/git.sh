#!/usr/bin/env bash

function bootstrap_git {

  echo "= Git Install"
  if [ -e /usr/local/bin/git ]; then
    echo "== Skipped, already installed"
  else
    echo "== From sources"
    cd /tmp
    wget http://git-core.googlecode.com/files/git-1.7.8.2.tar.gz
    tar xvf git-1.7.8.2.tar.gz
    pushd git-1.7.8.2
      ./configure
      make && make install
    popd
  fi
  echo "== Version: $(`git --version`)"
  echo "= Git Installed"
}