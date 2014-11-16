# Cloudstack basic binary installation

The goal of this project is to allow a user to define a cloudstack version
and quickly bring up an basic networking environment within vagrant.

Please make sure your virtualbox network interfaces are configured as stated in the parent readme.

## Running

To bring up the environment execute:

```bash
vagrant up
```

To change the way the environment is configured look at:

 - chef_configuration.json
 - marvin.cfg.erb
 - VagrantFile

## Defaults

### Management Server

 - IP: 192.168.22.5
 - Username: vagrant or root
 - Password: vagrant
 - Cloudstack Version: 4.3.1

### Hypervisor

 - IP: 192.168.22.10
 - Username: root
 - Password: password
 - Hypervisor: Xenserver 6.2