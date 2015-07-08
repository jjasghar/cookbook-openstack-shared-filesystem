

execute "nuke the manila db from orbit" do
  command "mysql -u%DATABASE_USER% -p%DATABASE_PASSWORD% -h%MYSQL_HOST% -e 'DROP DATABASE IF EXISTS manila;'"
  creates "#{Chef::Config[:file_cache_path]}/manila/.nukeddbfromorbit"
  action :run
end

execute "create the manila database" do
  command "mysql -u%DATABASE_USER% -p%DATABASE_PASSWORD% -h%MYSQL_HOST% -e 'CREATE DATABASE manila CHARACTER SET utf8;'"
  creates "#{Chef::Config[:file_cache_path]}/manila/.createdmaniladb"
  action :run
end

execute "synced the manila dbs" do
  command "manila-manage db sync"
  creates "#{Chef::Config[:file_cache_path]}/manila/.syncdmaniladb"
  action :run
end
