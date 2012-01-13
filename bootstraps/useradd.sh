#!/usr/bin/env bash

function bootstrap_useradd {
	echo "= Adding user"

	if [ -d /home/p360 ]; then
    echo "== Skipped, already created"
  else
  	useradd -m p360

  	echo "= User added"
  fi
}