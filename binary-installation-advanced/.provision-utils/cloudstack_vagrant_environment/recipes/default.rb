service 'iptables' do
  action [:disable, :stop]
  only_if { platform?(%w{redhat centos fedora oracle}) }
end

include_recipe 'cloudstack_vagrant_environment::nfsshares'
include_recipe 'cloudstack_vagrant_environment::database_server'
include_recipe 'cloudstack_vagrant_environment::management_server'