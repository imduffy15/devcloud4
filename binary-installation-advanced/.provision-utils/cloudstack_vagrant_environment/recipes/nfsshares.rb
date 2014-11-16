include_recipe 'nfs::server'

directory node['cloudstack']['secondary']['path'] do
  owner 'root'
  group 'root'
  action :create
  recursive true
end

nfs_export node['cloudstack']['secondary']['path'] do
  network '*'
  writeable true
  sync false
  options %w(no_root_squash no_subtree_check)
end

directory node['cloudstack']['primary']['path'] do
  owner 'root'
  group 'root'
  action :create
  recursive true
end

nfs_export node['cloudstack']['primary']['path'] do
  network '*'
  writeable true
  sync false
  options %w(no_root_squash no_subtree_check)
end
