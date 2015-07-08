OpenStack-Shared-Filesystem Cookbook
====================================

This is a cookbook to install [Manila](http://docs.openstack.org/developer/manila/) for OpenStack.

Requirements
------------

- Ubuntu 14.04
- MySQL database
- RabbitMQ message bus
- OpenStack Keystone
- Git

Attributes
----------

Attributes are self documented in `attributes/*.rb`

Usage
-----
#### openstack::default

Installs the full application stack.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[openstack-shared-filesystem]"
  ]
}
```

Contributing
------------

Please use the typical Contrubution rules we have set up [here](https://wiki.openstack.org/wiki/Chef/GettingStarted#Contributing_to_the_OpenStack_Chef_Cookbooks),
if you have any questions about this book please go to `irc.freenode.net:#openstack-chef` or contact the [mailing-list](http://groups.google.com/group/opscode-chef-openstack).

License and Authors
-------------------

Apache 2

JJ Asghar, <jj@chef.io>
