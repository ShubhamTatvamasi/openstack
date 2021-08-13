# openstack

install openstack

```bash
sudo apt purge python3-simplejson
sudo apt purge python-pyasn1-modules
```

https://docs.openstack.org/devstack/latest/

Specs required
```
Ubuntu 18.04 LTS
RAM 16gb
Storage 20gb
CPU 6
Network should have a static ip
```

GCP specs
```
n1-standard-4 (4 vCPUs, 15 GB memory)
Ubuntu 18.04 LTS
SSD 50gb
Static IP
Allow http and https
```

local.conf
```
[[local|localrc]]
ADMIN_PASSWORD=secret
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD
```

after the installation is complete download the RC file from the dashboard

run the following command and enter the password
```
source admin-openrc.sh
```
> nomoresecret


