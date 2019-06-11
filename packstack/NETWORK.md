# network

source the credentials first
```
source keystonerc_admin
```

get the list of all network commands 
```
openstack command list | grep openstack.network -A 116
```

list of commands for creating a network
```
openstack network create -h
```

run this command to create your provider network for your instances so they can communicate #with the outside world
```
openstack network create external_network --provider-network-type flat --provider-physical-network extnet
```

list of commands for creating a subnet
```
openstack subnet create -h
```

this command creates the subnet attached to your provider network. You should be doing the configuration according to the LAN that your linux machine is connected to
```
openstack subnet create --gateway 192.168.100.1 --subnet-range 192.168.100.0/24 --no-dhcp --allocation-pool start=192.168.100.100,end=192.168.100.120 --network public public_subnet
```
---

get the list of all network agents
```
openstack network agent list
```

system neutron status
```
systemctl status neutron-server
```

check ovs config
```
ovs-vsctl show
```

create a new network
```
openstack network create intnet
```

create a subnet for the network
```
openstack subnet create subnet1 --subnet-range 10.5.5.0/24 --dns-nameserver 8.8.8.8 --network intnet
```

<!-- get the list of available namespace
```
ip netns
ip netns exec <namespace> ping 10.5.5.2
ip netns exec <namespace> ip address show
ovs-vsctl show

``` -->

create a new router
```
openstack router create R2
```

attach your router to subnet
```
openstack router add subnet R2 subnet1
```

assign gateway to the router
```
openstack router set --external-gateway public R2
```


<!-- ovs-vsctl show
ip netns
ip nets exec <namespace> ip a show
ip nets exec <namespace> ping 5.5.5.1
neutron router-gateway-set R2 external_network
Openstack network list -->


create a new instance
```
openstack server create --image cirros --flavor 1 --network intnet instance1
```

list of security group
```
openstack security group list
```

get the list of projects to match the security group
```
openstack project list
```

create security group rule
```
openstack security group rule create --src-ip 0.0.0.0/0 --protocol icmp --ingress <group_ID>
```

create new rule
```
openstack security group rule create --src-ip 0.0.0.0/0 --dst-port 22 --protocol tcp --ingress <group_ID>
```




ip netns exec <namespace> ssh cirros@10.5.5.X
Ping 10.5.5.1
ping 192.168.0.178
openstack subnet list
openstack floating ip create --subnet <subnet_ID> --floating-ip-address 192.168.0.110 <network_name_or_ID>
openstack server add floating ip <server_name> <IP_address>
ping <floating ip>
ssh root@<floating ip>
openstack ip availability list --project poc
$ openstack command list | grep openstack.network -A 70