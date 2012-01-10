#!/usr/bin/env bash

function bootstrap_ruby_1_9_2_p290 {

  echo "= Ruby 1.9.2-p290 Install"
  if [ -n "`ruby --version | grep ruby 1.9.2-p290`" ]; then
    echo "== Skipped, already installed"
  else
    cd /tmp
    git clone https://github.com/sstephenson/ruby-build.git
    cd ruby-build
    ./install.sh

    ruby-build 1.9.2-p290 /usr/local/ruby-1.9.2-p290

    ln -s /usr/local/ruby-1.9.2-p290 /usr/local/ruby
    ln -s /usr/local/ruby/bin/ruby /usr/local/bin/ruby
    ln -s /usr/local/ruby/bin/ri /usr/local/bin/ri
    ln -s /usr/local/ruby/bin/irb /usr/local/bin/irb
    ln -s /usr/local/ruby/bin/rdoc /usr/local/bin/rdoc
    ln -s /usr/local/ruby/bin/gem /usr/local/bin/gem

    echo "gem: --no-ri --no-rdoc --bindir /usr/local/bin" | tee /etc/gemrc
    echo "export PATH=$PATH:/usr/local/ruby/bin" | tee -a $HOME/.bashrc
    source $HOME/.bashrc

    (
    cat <<EOF
      install: --no-rdoc --no-ri
      update: --no-rdoc --no-ri
EOF
    ) | tee "$HOME/.gemrc"
    
  fi
  echo "== Version: $(ruby --version)"
  echo "= Ruby 1.9.2-p290 Installed"

}