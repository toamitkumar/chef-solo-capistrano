#
# Cookbook Name:: rails
# Recipe:: simulator
#

include_recipe "mysql::client"

nginx_path = node[:passenger][:production][:path]

template "#{nginx_path}/conf/sites.d/test.conf" do
  source "zeromile.conf.erb"
  owner "root"
  group "root"
  mode 0644
  variables node[:app_config]
  notifies :restart, 'service[passenger]'
end