#!/usr/bin/env bash

function bootstrap_base_packages {

  echo "= Base packages"
  if [ "10" -eq "$VERSION" ]; then
    zypper --non-interactive install -l gcc gcc-c++ zlib-devel openssl-devel curl-devel readline-devel
  elif [ "11" -eq "$VERSION" ]; then
    zypper --non-interactive install -l gcc-c++ patch zlib zlib-devel libffi-devel sqlite3-devel libxml2-devel libxslt-devel libreadline5 readline-devel libopenssl-devel libexpat-devel libcurl-devel
  else
    echo "== Unhandled version: $VERSION"
    exit
  fi
  echo "= Base packages installed"
}