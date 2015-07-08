# Encoding: utf-8
#
# Cookbook Name:: cookbook-openstack-shared-filesystem
# Recipe:: default
#
# Copyright 2015, JJ Asghar
#



git "#{Chef::Config[:file_cache_path]}/manila" do
   repository "https://github.com/openstack/manila"
   reference "stable/kilo"
   action :sync
end

python 'setup.py' do
  cwd Chef::Config[:file_cache_path]/manila
  code <<-EOH
      sudo python setup.py install
      EOH
  not_if { ::File.exists?(extract_path) }
end
