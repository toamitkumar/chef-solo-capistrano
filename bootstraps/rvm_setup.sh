#!/usr/bin/env bash

function bootstrap_rvm_setup {

  echo "= RVM Installing"
  if [ -e $HOME/.rvm]; then
    echo "== Skipped, RVM already installed"
  else
    echo "= From sources"
    pushd /tmp
      curl -s -O -L -B https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer
      chmod 0755 rvm-installer

      bash -e "$PWD/rvm-installer" --version latest

      echo 'rvm_path="$HOME/.rvm"' | tee -a "$HOME/.rvmrc"
      echo "rvm_install_on_use_flag=1" | tee -a  "$HOME/.rvmrc"
    popd
        
    #bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )

    echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*' | tee -a "$HOME/.bash_profile"

    echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.' | tee -a "$HOME/.bashrc"

    source "$HOME/.bash_profile"
    source "$HOME/.bashrc"
  fi
  echo "= RVM Installed"

}