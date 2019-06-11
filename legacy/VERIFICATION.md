# verification


install pre-request
```
yum install epel-release -y
yum install python-pip -y
yum install wget -y
```

Install rally
```


wget -q -O- https://raw.githubusercontent.com/openstack/rally/master/install_rally.sh | bash


yum install -y openstack-rally
```

setup database for rally
```
rally-manage db recreate
```

source keystone
```
source keystonerc_admin
```

create a rally deployment
```
rally deployment create --fromenv --name=existing
```
