# Tyk Ansible Playbook Repo
This repo allows you to install Tyk to any server(s) of your choice using Ansible.

## Requirements
1. [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

## Getting Started
1. Clone repo and navigate to the repo directory.
2. Run initalization script to initialize environment `sh scripts/init.sh`.
3. Modify `hosts.yml` file to update ssh variables to your server(s). You can learn more about the hosts file [here](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html).
4. Run `ansible-playbook playbook.yml` to install Tyk.

## Installation flavors
Installation falvors can be specified by using the `-t {tag}` at the end of the `ansible-playbook` command. Not specifying a tag will install **Tyk Pro** as well as **Redis** and **MongoDB**.

- **tyk-pro**: `dashboard`, `gateway`, `pump`
- **tyk-ce**: `gateway` with CE config
- **redis**: `redis`
- **mongodb**: `mongodb`
- **tyk-dashboard**: `dashboard`
- **tyk-gateway**: `gateway`
- **tyk-pump**: `pump`

## Supported Servers
| Distribution | Version | Supported |
| --------- | :---------: | :---------: |
| Amazon Linux | 2 | ✅ |
| CentOS | 8 | ⚠️ |
| CentOS | 7 | ✅ |
| CentOS | 6 | ❌ |
| Debian | 10 | ✅ |
| Debian | 9 | ✅ |
| Debian | 8 | ❌ |
| RHEL | 8 | ⚠️ |
| RHEL | 7 | ✅ |
| RHEL | 6 | ❌ |
| Ubuntu | 20 | ✅ |
| Ubuntu | 18 | ✅ |
| Ubuntu | 16 | ✅ |
| Ubuntu | 14 | ❌ |

| Symbol | Description |
| :---------: | --------- |
| ✅ | Tested / Supported |
| ⚠️ | Tested / Not officially supported by Tyk |
| ❌️ | Untested / Not supported by tool |

## Variables
- `vars/mongodb.yml`

| Variable | default value | Comments |
| --------- | :---------: | --------- |
| bind_ip | `0.0.0.0` | Binding address of MongoDB |
| mongodb_version | `4.4` | MongoDB version |

Read more about MongoDB configuration [here](https://github.com/ansible-collections/community.mongodb).

- `vars/redis.yml`

| Variable | default value | Comments |
| --------- | :---------: | --------- |
| redis_bind_interface | `0.0.0.0` | Binding address of Redis |

Read more about Redis configuration [here](https://github.com/geerlingguy/ansible-role-redis).

- `vars/tyk.yml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| dashboard_protocol | `http` | Dashboard server protocol |
| dashboard_host | | Dashboard server host if different than the hosts url |
| dashboard_port | `3000` | Dashboard server listening port |
| gateway_protocol | `http` | Gateway server protocol |
| gateway_host | | Gateway server host if different than the hosts url |
| gateway_port | `8080` | Gateway server listening port |
| redis_host | | Redis server host if different than the hosts url |
| redis_port | `6379` | Redis server listening port |
| redis_enable_cluster | `false` | Enable if redis is running in cluster mode |
| redis_enable_ssl | `false` | Enable if redis connection is secured with SSL |
| mongodb_host | | MongoDB server host if different than the hosts url |
| mongodb_port | `27017` | MongoDB server listening port |
