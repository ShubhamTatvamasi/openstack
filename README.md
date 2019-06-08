# openstack

We are using CentOS for this process

check your CentOS release 
```
cat /etc/redhat-release
```

populate your /etc/environment file with below locale settings 
```
vim /etc/environment
```
```
LANG=en_US.utf-8
LC_ALL=en_US.utf-8
```

check the status of firewalld service. Stop and disable it if enabled
```
systemctl status firewalld
systemctl stop firewalld
systemctl disable firewalld
```

check the status of NetworkManager service. Stop and disable it if enabled
```
systemctl status NetworkManager
systemctl stop NetworkManager
systemctl disable NetworkManager
```

enable and start network service
```
systemctl enable network 
systemctl start network
```

replace "enp0s3" with your interface name and check it's current settings
```
cat /etc/sysconfig/network-scripts/ifcfg-enp0s3
```

disable selinux from it's config file /etc/selinux/config 
```
vim /etc/selinux/config
```
```
SELINUX=disabled
```

reboot your system
```
reboot
```

after the reboot check the status of selinux, it should be disabled
```
getenforce
```

On RHEL, download and install the RDO repository RPM(not required for centos)
```
yum install -y https://rdoproject.org/repos/rdo-release.rpm
```

On CentOS install the latest release of openstack package
```
yum install -y centos-release-openstack-ocata
```

this updates your current packages
```
yum update -y
```

install packstack installer
```
yum install -y openstack-packstack
```

to check the IP addresses on your machine 
```
ip address show
```

run the packstack installer with below parameters
```
packstack --allinone --provision-demo=n --os-neutron-ovs-bridge-mappings=extnet:br-ex --os-neutron-ml2-type-drivers=vxlan,flat
```
> Installation may take about an hour depending on your hardware!



make sure your ethernet interface settings look like this, you should remove the IP address from the interface
```
vim /etc/sysconfig/network-scripts/ifcfg-enp0s3
```
```
TYPE=OVSPort
NAME=enp0s3
DEVICE=enp0s3
DEVICETYPE=ovs
OVS_BRIDGE=br-ex
ONBOOT=yes
```

make sure your external bridge settings look like below
```
vim /etc/sysconfig/network-scripts/ifcfg-br-ex
```
```
DEVICE=br-ex
DEVICETYPE=ovs
TYPE=OVSBridge
BOOTPROTO=static
IPADDR=192.168.100.11
NETMASK=255.255.255.0
GATEWAY=192.168.100.1
IPV4_FAILURE_FATAL=no
IPV6INIT=no
DNS1=8.8.8.8
ONBOOT=yes
```

restart the network service
```
service network restart
```

this command provides you the openstack admin privileges
```
source keystonerc_admin
```

run this command to create your provider network for your instances so they can communicate #with the outside world
```
neutron net-create external_network --provider:network_type flat --provider:physical_network extnet --router:external
```

this command creates the subnet attached to your provider network. You should be doing the configuration according to the LAN that your linux machine is connected to
```
neutron subnet-create --name public_subnet --enable_dhcp=False --allocation-pool start=192.168.100.100,end=192.168.100.120 --gateway=192.168.100.1 external_network 192.168.100.0/24
```
