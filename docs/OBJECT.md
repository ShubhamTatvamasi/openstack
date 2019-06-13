# object

show the storage account
```
openstack object store account show
```

list all your containers
```
openstack container list
```

create a container
```
openstack container create container1
```

list all your containers
```
openstack container list
```

create another container
```
openstack container create container2
```

object help
```
openstack object create -h
```

upload `keystonerc_admin` file to container1
```
openstack object create container1 keystonerc_admin
```

get the swift commands
```
swift tempurl
```

create a url for your files
```
swift post -m "Temp-URL-Key:b3968d0207b54ece87cccc06515a89d4"
```

show the storage account
```
openstack object store account show
```

publish the purl
```
swift tempurl get 1000 /v1/AUTH_72c319360b17412aaa6094d4377c6e08/container1/keystonerc_admin b3968d0207b54ece87cccc06515a89d4
```
> swift tempurl get <secounds> <path> <key>

get the public ip
```
Openstack endpoint show swift
```

object commands
```
openstack command list | grep object_store -A 17
```
