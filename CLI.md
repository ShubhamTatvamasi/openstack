# working from the CLI
 
source the credentials first
```
source keystonerc_admin
```

list the services
```
openstack server list
```

get the system info
```
export
```

create new flavor
```
openstack flavor create --disk 1 --ram 768 --id 20 newflavor
```
