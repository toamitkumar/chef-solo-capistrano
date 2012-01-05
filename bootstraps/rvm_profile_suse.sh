#!/usr/bin/env bash

function bootstrap_rvm_profile_suse {

  echo "= RVM profile configure"
  if [ -e /etc/profile.d/rvm.csh ]; then
    echo "== Skipped, already configured"
  else
    pushd /etc/profile.d
    (
      cat <<EOP
if [ -e /usr/local/lib/rvm ]; then
  source /usr/local/lib/rvm
fi
EOP
    ) >> rvm.csh
    (
      cat <<EOP
if [ -e /usr/local/lib/rvm ]; then
  . /usr/local/lib/rvm
fi
EOP
    ) >> rvm.sh
    popd
  fi
  echo "= RVM profile configured"

}