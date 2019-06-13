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

list of commands for creating a subnet
```
openstack subnet create -h
```

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

get the list of available namespace
```
ip netns
```

test if the network is active
```
ip netns exec qdhcp-1a2035a3-6712-4de5-96ae-b383df4a7b7b ping 10.5.5.2
```

get the network details
```
ip netns exec qdhcp-1a2035a3-6712-4de5-96ae-b383df4a7b7b ip address show
```

check the network connection
```
ovs-vsctl show
```

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
openstack router set R2 --external-gateway public 
```

check the new router namespace
```
ovs-vsctl show
ip netns
```

show the ip address
```
ip netns exec qrouter-55945bf6-ac35-422b-84db-c14e45911aac ip address show
```

check router connection
```
ip netns exec qrouter-55945bf6-ac35-422b-84db-c14e45911aac ping 10.5.5.1
```

get the list of all networks
```
openstack network list
```

create a new instance
```
openstack server create --image cirros-0.4.0-x86_64-disk --flavor c1 --network intnet instance1
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

check the instance ip address
```
openstack server list
```

check if the instance is alive
```
ip netns exec qrouter-55945bf6-ac35-422b-84db-c14e45911aac ping 10.5.5.24
```

ssh into the instance
```
ip netns exec qrouter-55945bf6-ac35-422b-84db-c14e45911aac ssh cirros@10.5.5.24
```
> password: gocubsgo

ping default gateway inside instance
```
ping 10.5.5.1
```

get the list of floating ip
```
openstack subnet list
```

create a subnet for public access
```
openstack subnet create public-subnet-2 --subnet-range 192.168.100.0/24 --gateway 192.168.100.1 --dns-nameserver 8.8.8.8 --network public
```

attach your router to subnet
```
openstack router add subnet R2 public-subnet-2
```

assign new gateway to the router
```
openstack router set --route destination=192.168.100.0/24,gateway=192.168.100.1 --external-gateway public R2
```

create a floating ip
```
openstack floating ip create --subnet public-subnet-2 public
```

assign floating ip to the server
```
openstack server add floating ip instance1 192.168.100.88
openstack server add floating ip instance1 172.24.4.165
```

remove floating ip
```
openstack server remove floating ip instance1 192.168.100.88
openstack server remove floating ip instance1 172.24.4.165
```

trying pinging the floating ip
```
ping 172.24.4.165
```

ssh from outside
```
ssh cirros@172.24.4.165
```
> password: gocubsgo

get the list of all ip status related to the project 
```
openstack ip availability list --project admin
```
