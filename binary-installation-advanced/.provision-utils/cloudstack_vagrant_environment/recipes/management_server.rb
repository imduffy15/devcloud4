include_recipe 'cloudstack::marvin'
include_recipe 'cloudstack::management_server'

cloudstack_setup_database node['cloudstack']['db']['host'] do
  root_user node['cloudstack']['db']['rootusername']
  root_password node['cloudstack']['db']['rootpassword']
  user node['cloudstack']['db']['username']
  password node['cloudstack']['db']['password']
  action :create
end

cloudstack_prefill_database node['cloudstack']['db']['prefill'] do
  ip node['cloudstack']['db']['host']
  user node['cloudstack']['db']['username']
  password node['cloudstack']['db']['password']
end

cloudstack_system_template 'xenserver' do
  nfs_path node['cloudstack']['secondary']['path']
  nfs_server node['cloudstack']['secondary']['host']
  db_user node['cloudstack']['db']['username']
  url node['cloudstack']['hypervisor_tpl']['xenserver']
  db_password node['cloudstack']['db']['password']
  db_host node['cloudstack']['db']['host']
  action :create
end

cloudstack_setup_management node.name

service 'cloudstack-management' do
  action [:enable, :start]
end

cloudstack_configure_cloud node['cloudstack']['configuration'] do
  database_server_ip node['cloudstack']['db']['host']
  database_user node['cloudstack']['db']['username']
  database_password node['cloudstack']['db']['password']
end
