# Devcloud 4

## Introduction

The follow project aims to simplify getting a full Apache Cloudstack environment running on your machine.

The included VagrantFile will give you:

 - Management
     - NFS Server
     - MySQL Server
     - Router
     - * Cloudstack Management Server * (Only given in binary installation)

 - XenServer 6.2

## Issue reporting

Please use the issue reporting feature on github for reporting any issues you experience.

Github will email project authors and they will be able to assist best, going off to mailing lists, forums, question sites etc. is not helpful and will not benefit the quality of this project.

## Getting started

1. Ensure your system has `git` installed.

1. Clone the repository:

	```bash
	git clone https://github.com/imduffy15/devcloud4.git
	```

1. Download and Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
 
1. Download and install [Vagrant](https://www.vagrantup.com/downloads.html)

1. Ensure all Vagrant Plugins are installed:

	```bash
	cd /path/to/cloned/repo
	bash scripts/vagrant_prep.sh vbox
	```
### Configure virtualbox

1. Open virtualbox and navigate to its preferences/settings window. 

1. Click onto the network tab and then onto the host only network tab. 

1. Configure your adapters as follows:

    #### For Basic Networking you only need:

    ##### vboxnet0
    - IPv4 IP address of 192.168.22.1
    - Subnet of 255.255.255.0
    - DHCP server disabled
    
    #### For Advanced Networking you will need:
    
    
    
    ##### vboxnet1
    - IPv4 IP address of 192.168.23.1
    - Subnet of 255.255.255.0
    - DHCP server disabled
    
    
    
    ##### vboxnet2
    - IPv4 IP address of 192.168.24.1
    - Subnet of 255.255.255.0
    - DHCP server disabled
    
    
    
![Host only network](https://gist.githubusercontent.com/imduffy15/34d5b2fb6bb0d68d48c0/raw/Screen%20Shot%202014-06-16%20at%2019.23.04.png)


![Host only network configuration ip IP](https://gist.github.com/imduffy15/34d5b2fb6bb0d68d48c0/raw/09e14e7e6b6c5918c0bb267f4fc925e04dbe44f4/Screen%20Shot%202014-06-16%20at%2019.22.58.png)


![Host only network configuration dhcp](https://gist.github.com/imduffy15/34d5b2fb6bb0d68d48c0/raw/66f5be5429638a3544f2a48719685e0f415b2322/Screen%20Shot%202014-06-16%20at%2019.23.00.png)

