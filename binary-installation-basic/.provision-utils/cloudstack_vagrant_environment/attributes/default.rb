# Database configurations
default['cloudstack']['db']['host'] = '127.0.0.1'
default['cloudstack']['db']['user'] = 'cloud'
default['cloudstack']['db']['password'] = 'password'
default['cloudstack']['db']['rootusername'] = 'root'
default['cloudstack']['db']['rootpassword'] = 'cloud'
default['cloudstack']['db']['management_server_key'] = 'password'
default['cloudstack']['db']['database_key'] = 'password'
default['cloudstack']['db']['prefill'] = '/vagrant/prefill.sql'

default['cloudstack']['secondary']['host'] = node['ipaddress']
default['cloudstack']['secondary']['path'] = '/data/secondary'
default['cloudstack']['secondary']['mgt_path'] = node['cloudstack']['secondary']['path']

default['cloudstack']['primary']['host'] = node['ipaddress']
default['cloudstack']['primary']['path'] = '/data/primary'
default['cloudstack']['primary']['mgt_path'] = node['cloudstack']['primary']['path']


default['cloudstack']['configuration'] = '/vagrant/marvin.cfg.erb'