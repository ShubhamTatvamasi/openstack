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
