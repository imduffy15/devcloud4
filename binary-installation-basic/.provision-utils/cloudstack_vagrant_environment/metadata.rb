name 'cloudstack_vagrant_environment'
maintainer 'Ian Duffy'
maintainer_email 'ian@ianduffy.ie'
license 'Apache 2'
description 'Automates the creation of a basic networking cloudstack environment.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

depends 'mysql', '> 5.2.0'
depends 'cloudstack', '>= 3.0.0'
depends 'nfs', '>= 2.0.0'

supports 'centos'
supports 'redhat'
supports 'debian'
supports 'ubuntu'
supports 'fedora'
supports 'oracle'

provides 'cloudstack_vagrant_environment::default'
provides 'cloudstack_vagrant_environment::management_server'
provides 'cloudstack_vagrant_environment::database_server'
provides 'cloudstack_vagrant_environment::nfs_server'
