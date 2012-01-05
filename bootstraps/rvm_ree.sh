#!/usr/bin/env bash

function bootstrap_rvm_ree {

  echo "= RubyEE 1.8.7 Install"
  if [ -n "`rvm list | grep ree-1.8.7`" ]; then
    echo "== Skipped, already installed"
  else
    if [ "10" -eq "$VERSION" ]; then
      # REE needs a ruby installed to configure itself
      # as on Suse 10 the included miniruby do not work
      rvm install 1.8.7
      rvm use 1.8.7
    fi
    rvm install ree
    rvm ree --default
    echo "gem: --no-rdoc --no-ri" > /etc/gemrc
    chgrp rvm /etc/gemrc
  fi
  echo "== Version: $(ruby --version)"
  echo "= RubyEE 1.8.7 Installed"

}