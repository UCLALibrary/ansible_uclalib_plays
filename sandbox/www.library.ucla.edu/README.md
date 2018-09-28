# Main Library Website Sandbox/Dev Build

This sandbox directory contains necessary Ansible playbooks to build a base test server for drupal development on a developer's workstation. While not completely identical, the versions used mimics what we run in production.

## Getting Started

This documentation is still in development. We're looking for ideas/ways to make this build as seamless as possible.

### Prerequisites

* git v1.8.x+
* ansible v2.6.x+

```
I should dump some instructions here for ansible on different distributions/OS's
```

### Setting up ansible

After the prerequisites are installed, you'll need to set up your ansible environment

```
cp -rp ansible.cfg /etc/ansible/ansible.cfg
ansible-galaxy -vv install -r requirements.yml
```

### Running the playbook

With the ansible configuration and roles in place, you should now be able to run your playbook

```
# Run as the root user
ansible-playbook -vv -l localhost localdev-build.yml
```