#!/usr/bin/env bash

function bootstrap_chef {

  echo "= Chef Install"
  if [ -n "`gem list | grep chef`" ]; then
    echo "== Skipped, already installed"
  else
    gem install chef ohai
  fi
  echo "== Version: $(chef-client --version)"
  echo "= Chef Installed"

}