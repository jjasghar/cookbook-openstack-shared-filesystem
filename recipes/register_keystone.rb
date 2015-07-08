

execute "create keystone user for manila" do
  command "keystone user-create --name manila --pass #{node['cookbook-openstack-shared-filesystem']['manila-password']}"
  creates "#{Chef::Config[:file_cache_path]}/manila/.usercreated"
  action :run
end

execute "make the user an admin role for manila" do
  command "keystone user-role-add --user manila --tenant service --role admin"
  creates "#{Chef::Config[:file_cache_path]}/manila/.useradminified"
  action :run
end

execute "manila service enities" do
  command "keystone service-create \
             --name manila \
             --type share \
             --description 'OpenStack Shared Filesystems'"
  creates "#{Chef::Config[:file_cache_path]}/manila/.serviceenititescreated"
  action :run
end

controller = node['cookbook-openstack-shared-filesystem']['manila-controller']
region = node['cookbook-openstack-shared-filesystem']['manila-region']

execute "manila api endpoint creation" do
  command "keystone endpoint-create \
             --service-id $(keystone service-list | awk '/ share / {print $2}') \
             --publicurl http://#{controller}:8786/v1/%\(tenant_id\)s \
             --internalurl http://#{controller}:8786/v1/%\(tenant_id\)s \
             --adminurl http://#{controller}:8786/v1/%\(tenant_id\)s \
             --region #{region}"
  creates "#{Chef::Config[:file_cache_path]}/manila/.apiendpointcreated"
  action :run
end
