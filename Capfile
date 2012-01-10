#
# Chef-Solo Capistrano Bootstrap
#
# usage:
#   cap chef:bootstrap <dna> <remote_host>
#
# NOTICE OF LICENSE
#
# Copyright (c) 2010 Mike Smullin <mike@smullindesign.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# configuration
default_run_options[:pty] = true # fix to display interactive password prompts
target = ARGV[-1].split(':')
if (u = ARGV[-1].split('@')[-2])
  set(:user, u)
end
role :target, target[0]
set :port, target[1] || 22
cwd = File.expand_path(File.dirname(__FILE__))
cookbook_dir = '/var/chef-solo'
node = ARGV[-2]

file_cache_path = '/var/chef-solo'
cookbook_path = '/var/chef-solo/cookbooks'
dna_path = '/var/chef-solo/dna'
config_path = '/etc/chef'


namespace :chef do
  desc "Bootstrap a SUSE server and kick-start Chef-Solo"
  task :bootstrap, :roles => :target do
    run "git clone git@github.intranet.mckinsey.com:Amit-Kumar/chef-solosuse.git #{file_cache_path}"
    run "cd #{file_cache_path} && source bootstrap.sh"
  end


  desc "Executes the chef dna"
  task :execute, :roles => :target do
    update_cookbook_repo
    solo
  end

  desc "Re-install Cookbook Repository from cwd"
  task :update_cookbook_repo, :roles => :target do
    run "cd #{file_cache_path} && git pull origin master"
  end

  desc "Execute Chef-Solo"
  task :solo, :roles => :target do
    run "chef-solo -c #{config_path}/solo.rb -j #{dna_path}/#{node}.json -l debug -N test"

    exit # subsequent args are not tasks to be run
  end

  desc "Installs public keys into the specified user"
  task :install_key, :roles => :target do
    run "mkdir -p ~/.ssh"
    lines = File.read(File.expand_path('~/.ssh/id_rsa.pub'))
    run "echo #{lines} | tee -a ~/.ssh/authorized_keys"
    run "chmod 700 ~/.ssh"
    run "chmod 600 ~/.ssh/authorized_keys"
  end

end

def sudo_env(cmd)
  run "#{sudo} -i #{cmd}"
end

def msudo(cmds)
  cmds.each do |cmd|
    sudo cmd
  end
end