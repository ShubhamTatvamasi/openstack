# openstack

We are using centos for this process

Enable the OpenStack repository
```
yum install -y centos-release-openstack-ocata
```

Update the packages
```
yum update -y
```

Install packstack
```
yum install -y openstack-packstack
```

Install openstack
```
packstack --allinone --provision-demo=n --os-neutron-ovs-bridge-mappings=extnet:br-ex --os-neutron-ml2-type-drivers=vxlan,flat
```
> Installation may take about an hour depending on your hardware!

