#!/usr/bin/env bash

function bootstrap_bundler {

  echo "= Bundler Install"
  if [ -n "`gem list | grep bundler`" ]; then
    echo "== Skipped, already installed"
  else
    gem install bundler
  fi
  echo "== Version: $(gem list | grep bundler)"
  echo "= Bundler Installed"

}