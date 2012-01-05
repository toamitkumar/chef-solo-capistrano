#!/usr/bin/env bash

function bootstrap_chef_solo {

  echo "= Chef-Solo configure"
  if [ -e /etc/chef ]; then
    echo "== Skipped, already configured"
  else
    FILE_CACHE_PATH="/var/chef-solo"
    CONFIG_PATH="/etc/chef"

    mkdir -m 0775 -p $CONFIG_PATH

    (
      cat <<EOP
        file_cache_path "$FILE_CACHE_PATH"
        cookbook_path   ["$FILE_CACHE_PATH/cookbooks"]
        role_path       "$FILE_CACHE_PATH/roles"
EOP
    ) | tee /etc/chef/solo.rb

  fi
  echo "= Chef-Solo configured"

}