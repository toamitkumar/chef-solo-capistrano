#!/usr/bin/env bash

function bootstrap_rvm_ruby_1_9_3_p0 {

  echo "= Ruby 1.9.3-p0 Install"
  if [ -n "`rvm list | grep 1.9.3-p0`" ]; then
    echo "== Skipped, already installed"
  else
    rvm install 1.9.3
    rvm 1.9.3 --default

    sudo ln -s $HOME/.rvm/rubies/ruby-1.9.3-p0 /usr/local/ruby
    sudo ln -s /usr/local/ruby/bin/ruby /usr/local/bin/ruby
    sudo ln -s /usr/local/ruby/bin/ri /usr/local/bin/ri
    sudo ln -s /usr/local/ruby/bin/irb /usr/local/bin/irb
    sudo ln -s /usr/local/ruby/bin/rdoc /usr/local/bin/rdoc
    sudo ln -s /usr/local/ruby/bin/gem /usr/local/bin/gem

    echo "gem: --no-ri --no-rdoc --bindir /usr/local/bin" | sudo tee /etc/gemrc
    echo "export PATH=$PATH:/usr/local/ruby/bin" | tee -a $HOME/.bashrc
    source $HOME/.bashrc

    (
    cat <<EOF
      install: --no-rdoc --no-ri
      update: --no-rdoc --no-ri
EOF
    ) | sudo tee "$HOME/.gemrc"
    
  fi
  echo "== Version: $(rvm 1.9.3 && ruby --version)"
  echo "= Ruby 1.9.3-p0 Installed"

}