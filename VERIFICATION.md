# verification

Install rally
```
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
