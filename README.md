# openstack


first install docker in centos

https://docs.docker.com/install/linux/docker-ce/centos/

### Install dependencies

if unable to ssh into system
```
service network restart
```

install git
```
yum install git -y
```

install EPEL
```
yum install epel-release -y
```

Install Python build dependencies:
```
yum install python-devel libffi-devel gcc openssl-devel libselinux-python -y
```

Install the virtualenv package:
```
yum install python-pip -y
```

Create a virtual environment and activate it:
```
virtualenv /path/to/virtualenv
source /path/to/virtualenv/bin/activate
```

Ensure the latest version of pip is installed:
```
pip install -U pip
```

Install Ansible. Currently, Kolla Ansible requires Ansible 2.4+.
```
pip install ansible
```

### Install Kolla-ansible

Install kolla-ansible and its dependencies using pip.
```
pip install kolla-ansible
```

Create the /etc/kolla directory.
```
sudo mkdir -p /etc/kolla
sudo chown $USER:$USER /etc/kolla
```

Copy globals.yml and passwords.yml to /etc/kolla directory.
```
cp -r /path/to/virtualenv/share/kolla-ansible/etc_examples/kolla/* /etc/kolla
```

Copy all-in-one and multinode inventory files to the current directory.
```
cp /path/to/virtualenv/share/kolla-ansible/ansible/inventory/* .
```

Clone kolla and kolla-ansible repositories from git.
```
git clone https://github.com/openstack/kolla
git clone https://github.com/openstack/kolla-ansible
```

Install requirements of kolla and kolla-ansible:
```
pip install -r kolla/requirements.txt
pip install -r kolla-ansible/requirements.txt
```

Create the /etc/kolla directory.
```
sudo mkdir -p /etc/kolla
sudo chown $USER:$USER /etc/kolla
```

Copy the configuration files to /etc/kolla directory. kolla-ansible holds the configuration files ( globals.yml and passwords.yml) in etc/kolla.
```
cp -r kolla-ansible/etc/kolla/* /etc/kolla
```

Copy the inventory files to the current directory. kolla-ansible holds inventory files ( all-in-one and multinode) in the ansible/inventory directory.
```
cp kolla-ansible/ansible/inventory/* .
```

### Deployment

Bootstrap servers with kolla deploy dependencies:
```
kolla-ansible -i ./all-in-one bootstrap-servers
```

Do pre-deployment checks for hosts:
```
kolla-ansible -i ./all-in-one prechecks
```

Finally proceed to actual OpenStack deployment:
```
kolla-ansible -i ./all-in-one deploy
```




