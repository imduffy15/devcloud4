# CLOUDSTACK-6114

## Introduction

The follow project aims to simplify getting a full Apache Cloudstack environment running on your machine.

The included VagrantFile will give you:

 - Management
     - NFS Server
     - MySQL Server
     - Router

 - XenServer 6.2

## Getting started

1. Ensure your system has `git` installed.

1. Clone the repository:

	```bash
	git clone https://github.com/imduffy15/GSoC-2014.git
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
    - IPv4 IP address of 192.168.56.1
    - Subnet of 255.255.255.0
    - DHCP server disabled
    
    #### For Advanced Networking you will need:
    
    
    
    ##### vboxnet1
    - IPv4 IP address of 192.168.57.1
    - Subnet of 255.255.255.0
    - DHCP server disabled
    
    
    
    ##### vboxnet2
    - IPv4 IP address of 192.168.58.1
    - Subnet of 255.255.255.0
    - DHCP server disabled
    
    
    
![Host only network](https://gist.githubusercontent.com/imduffy15/34d5b2fb6bb0d68d48c0/raw/Screen%20Shot%202014-06-16%20at%2019.23.04.png)


![Host only network configuration ip IP](https://gist.github.com/imduffy15/34d5b2fb6bb0d68d48c0/raw/09e14e7e6b6c5918c0bb267f4fc925e04dbe44f4/Screen%20Shot%202014-06-16%20at%2019.22.58.png)


![Host only network configuration dhcp](https://gist.github.com/imduffy15/34d5b2fb6bb0d68d48c0/raw/66f5be5429638a3544f2a48719685e0f415b2322/Screen%20Shot%202014-06-16%20at%2019.23.00.png)


### Start the vagrant boxes


#### Cloudstack With Basic Networking:

```bash
cd /path/to/GSoC-2014/repo/basic
vagrant up
```

#### Cloudstack With Advanced Networking:

```bash
cd /path/to/GSoC-2014/repo/advanced
vagrant up
```

*** Common issues: ***

- 'Cannot forward the specified ports on this VM': There could be MySQL or some other
  service running on the host OS causing vagrant to fail setting up local port forwarding.


### Start Cloudstack

1. Clone the Cloudstack Repository:

	```
	git clone https://github.com/apache/cloudstack.git
	```

	*** Note: ***
	
	Personally I prefer to use the 4.3 codebase rather than master. If you wish to do the same:	

	```
	git reset --hard 0810029
	```

1. Download vhd-util:

	```bash
	cd /path/to/cloudstack/repo
	wget http://download.cloud.com.s3.amazonaws.com/tools/vhd-util -P scripts/vm/hypervisor/xenserver/
	chmod +x scripts/vm/hypervisor/xenserver/vhd-util
	```

1. Compile Cloudstack:

	```bash
	cd /path/to/cloudstack/repo
	mvn -P developer,systemvm clean install -DskipTests=true
	```
	
1. Deploy Cloudstack Database:

	```bash
	cd /path/to/cloudstack/repo
	mvn -P developer -pl developer,tools/devcloud -Ddeploydb
	```

1. Start Cloudstack:

	```bash
	cd /path/to/cloudstack/repo
	mvn -pl :cloud-client-ui jetty:run
	```

1. Install Marvin:

	```
	cd /path/to/cloudstack/repo
	pip install tools/marvin/dist/Marvin-0.1.0.tar.gz
	```

##### FOR BASIC NETWORKING ONLY.

```
python -m marvin.deployDataCenter -i /path/to/GSoC-2014/repo/basic/basic.json 
```

#### FOR ADVANCED NETWORKING ONLY.

```
python -m marvin.deployDataCenter -i /path/to/GSoC-2014/repo/advanced/advanced.json 
```


