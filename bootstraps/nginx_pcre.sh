#!/usr/bin/env bash

function bootstrap_nginx_pcre {

  echo "= Installing Nginx PCRE depedency"
  if [ -e /usr/local/bin/pcre-config ]; then
    echo "== Skipped, already installed"
  else
    echo "== From sources"
    cd /tmp
    wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.21.tar.gz
    tar xvf pcre-8.21.tar.gz
    pushd pcre-8.21
      ./configure
      make && make install
    popd
  fi
  echo "== Version: $(`pcre-config --version`)"
  echo "= Nginx PCRE Installed"
}