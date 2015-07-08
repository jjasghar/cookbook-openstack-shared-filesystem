


execute "copy the correct files in" do
  command "cp -r #{Chef::Config[:file_cache_path]}/manila/etc/manila/* /etc/manila/"
  creates "/etc/manila/rootwrap.d/share.filters"
  action :run
end


template '/etc/manila/manila.conf' do
  source 'manila.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end
