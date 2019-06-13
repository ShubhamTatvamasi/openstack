# keystone

source the credentials first
```
source keystonerc_admin
```

endpoint list
```
openstack endpoint list
```

get the details of a specific endpoint
```
openstack endpoint show <Endpoint_ID>
```

catalog list
```
openstack catalog list
```

Get the list of all the projects
```
openstack project list
```

create a new project
```
openstack project create <project_name>
```

show project details
```
openstack project show <project_name>
```

set the description for a project
```
openstack project set --description "description_text" <project_name>
```

create a new user for a project
```
openstack user create --project <project_name> --password-prompt <user_name> 
```

get the list of roles
```
openstack role list
```

get role for the user
```
openstack role assignment list --project <project_name> --user <user_name>
```

give `_member_` role to a user 
```
openstack role add --project <project_name> --user <user_name> _member_ 
```

give `admin` role to a user
```
openstack role add --project <project_name> --user <user_name> admin 
```

list of all identity commands
```
openstack command list | grep openstack.identity -A 125
```

