#!/usr/bin/env bash

function bootstrap_ruby_1_9_3_p0 {

  echo "= Ruby 1.9.3-p0 Install"
  if [ -n "`ruby --version | grep ruby 1.9.3p0`" ]; then
    echo "== Skipped, already installed"
  else
    cd /tmp
    wget http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz
    tar xzvf yaml-0.1.4.tar.gz
    pushd yaml-0.1.4
      ./configure --prefix=/usr/local
      make && make install
    popd

    wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.tar.gz
    tar xzvf ruby-1.9.3-p0.tar.gz
    pushd ruby-1.9.3-p0
      ./configure --prefix=/usr/local --enable-shared --disable-install-doc --with-opt-dir=/usr/local/lib
      make && make install
    popd

    # cd /tmp
    # git clone https://github.com/sstephenson/ruby-build.git
    # cd ruby-build
    # ./install.sh

    # ruby-build 1.9.3-p0 /usr/local/ruby-1.9.3-p0

    # ln -s /usr/local/ruby-1.9.3-p0 /usr/local/ruby
    # ln -s /usr/local/ruby/bin/ruby /usr/local/bin/ruby
    # ln -s /usr/local/ruby/bin/ri /usr/local/bin/ri
    # ln -s /usr/local/ruby/bin/irb /usr/local/bin/irb
    # ln -s /usr/local/ruby/bin/rdoc /usr/local/bin/rdoc
    # ln -s /usr/local/ruby/bin/gem /usr/local/bin/gem

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
  echo "= Ruby 1.9.3-p0 Installed"

}