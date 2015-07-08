
%w[ /opt/stack /opt/stack/status /opt/stack/status/stack/ ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0755'
  end
end


execute "starting the manila-api service" do
  command "manila-api \
             --config-file /etc/manila/manila.conf & \
             echo $! >/opt/stack/status/stack/m-api.pid; \
             fg || echo 'm-api failed to start' | \
             tee '/opt/stack/status/stack/m-api.failure'"
  creates "#{Chef::Config[:file_cache_path]}/manila/.startingmanila-api"
  action :run
end

execute "creating a default share type" do
  command "manila type-create default_share_type True"
  creates "#{Chef::Config[:file_cache_path]}/manila/.creatingdefaultsharetype"
  action :run
end

execute "starting the manila-scheduler service" do
  command "manila-scheduler \
             --config-file /etc/manila/manila.conf & \
              echo $! >/opt/stack/status/stack/m-sch.pid; \
              fg || echo 'm-sch failed to start | \
              tee '/opt/stack/status/stack/m-sch.failure'"
  creates "#{Chef::Config[:file_cache_path]}/manila/.startingmanila-scheduler"
  action :run
end

execute "starting the manila-share service" do
  command manila-share \
    --config-file /etc/manila/manila.conf & \
    echo $! >/opt/stack/status/stack/m-shr.pid; \
    fg || echo 'm-shr failed to start' | \
    tee "/opt/stack/status/stack/m-shr.failure'"
  creates "#{Chef::Config[:file_cache_path]}/manila/.startingmanila-share"
  action :run
end
