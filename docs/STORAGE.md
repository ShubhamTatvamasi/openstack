# storage

storage services
```
cinder service-list
```

disable storage service
```
cinder service-disable
```

enable storage service
```
cinder service-enable
```

list volume commands
```
openstack command list | grep openstack.volume -A 68
```

volume help
```
openstack volume create -h
```

create a new volume
```
openstack volume create --size 1 vol1
```

list all volumes
```
openstack volume list
```

check the running instances
```
openstack server list
```

server help
```
openstack server -h
```

add volume to a server
```
openstack server add volume instance01 vol1
```

setup the volume
```
sudo mkfs.ext3 /dev/vdc
sudo mkdir /mydisk
sudo mount /dev/vdc /mydisk
```

help volume backup
```
openstack volume backup create -h
```

backup volume
```
openstack volume backup create --name backup1 --force vol1
```

backup show
```
openstack volume backup show backup1
```

create a snapshot
```
openstack volume snapshot create --force --volume vol1 snap1
```
