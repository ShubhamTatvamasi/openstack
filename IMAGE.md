# image

source the credentials first
```
source keystonerc_admin
```

get the list of all image commands 
```
openstack command list | grep openstack.image -A 10
```

get the list of all the images we have
```
openstack image list
```

download cirros image
```
curl -o /root/cirros-0.4.0.img http://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.img
```

add cirros image in openstack
```
openstack image create --min-disk 1 --disk-format qcow2 --file /root/cirros-0.4.0.img cirros
```

show a specific image
```
openstack image show <image_name>
```

download ubuntu image
```
curl -o /root/ubuntu-1804-lts-20190604-amd64.img http://cloud-images.ubuntu.com/bionic/20190604/bionic-server-cloudimg-amd64.img
```

add ubuntu image in openstack
```
openstack image create --min-disk 2 --disk-format qcow2 --file /root/ubuntu-1804-lts-20190604-amd64.img ubuntu-1804-lts-20190604
```

delete an image
```
openstack image delete <image_name>
```
