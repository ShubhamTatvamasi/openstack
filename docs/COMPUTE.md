# compute

list nova services
```
openstack compute service list
```

list flavors
```
openstack flavor list
```

get help for flavor creation 
```
openstack flavor create -h
```

create a flavor with ID=10, 256 mb ram, 2 gb disk & visible to others
```
openstack flavor create --id 10 --ram 256 --disk 2 --public tinier
```

get help for server create command
```
openstack server create -h
```

create a keypair named mykeypair and copy to mykeypair.key file
```
openstack keypair create mykeypair >> mykeypair.key
```

list images
```
openstack image list
```

list networks
```
openstack network list
```

create a server named instance01 with specified image, key pair, flavor and network.
```
openstack server create --image cirros-0.4.0-x86_64-disk --key-name mykeypair --flavor c1 --nic net-id=5386c435-3e88-4aff-a7af-a15e129827b1 instance01
```

show details about instance01
```
openstack server show instance01
```

see the filter config in nova.conf file
```
cat /etc/nova/nova.conf | grep filter
```

create a snapshot of instance01
```
openstack server image create --name snap1 instance01
```

list images
```
openstack image list
```

create an host aggregate with property SSD set to true
```
openstack aggregate create --property SSD=true agg1
```

show the console URL for instance01 
```
openstack console url show --novnc instance01
```

to see the instance logs from command line
```
openstack console log show instance01
```

to list all nova related commands
```
openstack command list | grep openstack.compute -A 84
```
