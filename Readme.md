# Tyk Ansible Playbook Repo
This repo allows you to install Tyk to any server(s) of your choice using Ansible.

## Requirements
1. [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

## Getting Started
1. Clone repo and navigate to the repo directory.
2. Run initalization script to initialize environment `sh scripts/init.sh`.
3. Modify `hosts.yaml` file to update ssh variables to your server(s). You can learn more about the hosts file [here](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html).
4. Run `ansible-playbook playbook.yaml` to install Tyk.

## Installation flavors
Installation falvors can be specified by using the `-t {tag}` at the end of the `ansible-playbook` command. Not specifying a tag will install **Tyk Pro** as well as **Redis** and **MongoDB**.

- **tyk-pro**: `dashboard`, `gateway`, `pump`
- **tyk-gateway-ce**: `gateway` with CE config
- **tyk-gateway-pro**: `gateway` with pro config
- **tyk-gateway-hybrid**: `gateway` with hybrid config
- **tyk-pump**: `pump`
- **redis**: `redis`
- **mongodb**: `mongodb`

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
- `vars/mongodb.yaml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| bind_ip | `0.0.0.0` | Binding address of MongoDB |
| mongodb_version | `4.4` | MongoDB version |

Read more about MongoDB configuration [here](https://github.com/ansible-collections/community.mongodb).

- `vars/redis.yaml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| redis_bind_interface | `0.0.0.0` | Binding address of Redis |

Read more about Redis configuration [here](https://github.com/geerlingguy/ansible-role-redis).

- `vars/tyk.yaml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| secrets.APISecret | `352d20ee67be67f6340b4c0605b044b7` | API secret |
| secrets.AdminSecret | `12345` | Admin secret |
| redis.host |  | Redis server host if different than the hosts url |
| redis.port | `6379` | Redis server listening port |
| redis.pass |  | Redis server password |
| redis.enableCluster | `false` | Enable if redis is running in cluster mode |
| redis.storage.database | `0` | Redis server database |
| redis.tls | `false` | Enable if redis connection is secured with SSL |
| mongo.host |  | MongoDB server host if different than the hosts url |
| mongo.port | `27017` | MongoDB server listening port  |
| mongo.tls | `false` | Enable if mongo connection is secured with SSL |
| dash.license | | Dashboard license|
| dash.service.host | | Dashboard server host if different than the hosts url |
| dash.service.port | `3000` | Dashboard server listening port |
| dash.service.proto | `http` | Dashboard server protocol |
| dash.service.tls | `false` | Set to `true` if you want the Dashboard to run with SSL |
| gateway.service.host | | Gateway server host if different than the hosts url |
| gateway.service.port | `8080` | Gateway server listening port |
| gateway.service.proto | `http` | Gateway server protocol |
| gateway.service.tls | `false` | Set to `true` if you want the Gateway to run with SSL |
| gateway.sharding.enabled | `false` | Set to `true` if you want the Gateway to run in sharded mode |
| gateway.sharding.tags | | Tags that will be loaded on the current Gateway |
| gateway.rpc.connString | | Use this setting to add the URL for your MDCB or load balancer host |
| gateway.rpc.useSSL | `false` | Set this option to `true` to use an SSL RPC connection|
| gateway.rpc.sslInsecureSkipVerify | `true` | Set this option to `true` to allow the certificate validation (certificate chain and hostname) to be skipped. This can be useful if you use a self-signed certificate |
| gateway.rpc.rpcKey | | Your organisation ID to connect to the MDCB installation |
| gateway.rpc.apiKey | | This the API key of a user used to authenticate and authorise the Gateway’s access through MDCB. The user should be a standard Dashboard user with minimal privileges so as to reduce any risk if the user is compromised. The suggested security settings are read for Real-time notifications and the remaining options set to deny |
