





include_recipe "openstack-shared-filesystem::default.rb"

python_virtualenv "/home/ubuntu/manila" do
  owner "ubuntu"
  group "ubuntu"
  action :create
end

python_pip "python-manilaclient" do
  virtualenv "/home/ubuntu/manila"
  version ">= 1.0.4"
end
