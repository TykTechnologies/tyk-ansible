# Tyk Ansible Playbook Repo
This repo allows you to install Tyk to any server(s) of your choice using Ansible.

## Requirements
1. [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

## Getting Started
1. Clone repo and navigate to the repo directory.
2. Run initalization script to initialize environment `sh scripts/init.sh`.
3. Modify `hosts.yaml` file to update ssh variables to your server(s). You can learn more about the hosts file [here](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html).
4. Run `ansible-playbook playbook.yaml -t redis -t mongodb -t tyk-pro` to install Tyk.

## Installation flavors
Installation falvors can be specified by using the `-t {tag}` at the end of the `ansible-playbook` command.

- **tyk-pro**: `dashboard`, `gateway`, `pump`
- **tyk-dashboard**: `dashboard`
- **tyk-gateway-ce**: `gateway` with CE config
- **tyk-gateway-pro**: `gateway` with pro config
- **tyk-gateway-hybrid**: `gateway` with hybrid config
- **tyk-pump**: `pump`
- **redis**: `redis`
- **mongodb**: `mongodb`
- **pgsql**: `pgsql`

## Supported Distributions
| Distribution | Version | Supported |
| --------- | :---------: | :---------: |
| Amazon Linux | 2 | ✅ |
| CentOS | 8 | ✅ |
| CentOS | 7 | ✅ |
| Debian | 10 | ✅ |
| Debian | 9 | ✅ |
| RHEL | 8 | ✅ |
| RHEL | 7 | ✅ |
| Ubuntu | 21 | ✅ |
| Ubuntu | 20 | ✅ |
| Ubuntu | 18 | ✅ |
| Ubuntu | 16 | ✅ |

## Variables
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
| pgsql.host |  | PGSQL server host if different than the hosts url |
| pgsql.port | `5432` | PGSQL server listening port  |
| pgsql.tls | `false` | Enable if pgsql connection is secured with SSL |
| dash.license | | Dashboard license|
| dash.service.host | | Dashboard server host if different than the hosts url |
| dash.service.port | `3000` | Dashboard server listening port |
| dash.service.proto | `http` | Dashboard server protocol |
| dash.service.tls | `false` | Set to `true` to enable SSL connections |
| dash.storage.type | `mongo` | Set to `postgres` to use Postgres instead of MongoDB |
| gateway.service.host | | Gateway server host if different than the hosts url |
| gateway.service.port | `8080` | Gateway server listening port |
| gateway.service.proto | `http` | Gateway server protocol |
| gateway.service.tls | `false` | Set to `true` to enable SSL connections |
| gateway.service.enableBundleDownloader | `false` | Set to `true` will enable bundle downloader |
| gateway.service.bundleBaseUrl | | Server where bundles are hosted |
| gateway.sharding.enabled | `false` | Set to `true` to enable filtering (sharding) of APIs |
| gateway.sharding.tags | | The tags to use when filtering (sharding) Tyk Gateway nodes. Tags are processed as OR operations. If you include a non-filter tag (e.g. an identifier such as `node-id-1`, this will become available to your Dashboard analytics) |
| gateway.rpc.connString | | Use this setting to add the URL for your MDCB or load balancer host |
| gateway.rpc.useSSL | `true` | Set this option to `true` to use an SSL RPC connection|
| gateway.rpc.sslInsecureSkipVerify | `true` | Set this option to `true` to allow the certificate validation (certificate chain and hostname) to be skipped. This can be useful if you use a self-signed certificate |
| gateway.rpc.rpcKey | | Your organisation ID to connect to the MDCB installation |
| gateway.rpc.apiKey | | This the API key of a user used to authenticate and authorise the Gateway’s access through MDCB. The user should be a standard Dashboard user with minimal privileges so as to reduce any risk if the user is compromised. The suggested security settings are read for Real-time notifications and the remaining options set to deny |
| gateway.rpc.groupId | | This is the `zone` that this instance inhabits, e.g. the cluster/data-centre the Gateway lives in. The group ID must be the same across all the Gateways of a data-centre/cluster which are also sharing the same Redis instance. This ID should also be unique per cluster (otherwise another Gateway cluster can pick up your keyspace events and your cluster will get zero updates). |

- `vars/redis.yaml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| redis_bind_interface | `0.0.0.0` | Binding address of Redis |

Read more about Redis configuration [here](https://github.com/geerlingguy/ansible-role-redis).

- `vars/mongodb.yaml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| bind_ip | `0.0.0.0` | Binding address of MongoDB |
| mongodb_version | `4.4` | MongoDB version |

Read more about MongoDB configuration [here](https://github.com/ansible-collections/community.mongodb).

- `vars/pgsql.yaml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| postgresql_databases[] | `[]` | Array of DBs to be created |
| postgresql_databases[].name | `tyk_analytics` | Database name |
| postgresql_users[] | `[]` | Array of users to be created |
| postgresql_users[`0`].name | `default` | User name |
| postgresql_users[`0`].password | `topsecretpassword` | User password |
| postgresql_global_config_options[] | `[]` | Postgres service config options |
| postgresql_global_config_options[`1`].option | `listen_addresses` | Listen address binding for the service |
| postgresql_global_config_options[`1`].value | `*` | Default value to listen to all addresses |
| postgresql_hba_entries[] | `[]` | Host based authenticaiton list|
| postgresql_hba_entries[`4`].type | `host` | Entry type |
| postgresql_hba_entries[`4`].database | `tyk_analytics` | Which database this entry will give access to |
| postgresql_hba_entries[`4`].user | `default` | What users this gain access from this entry |
| postgresql_hba_entries[`4`].address | `0.0.0.0/0` | What addresses this gain access from this entry |
| postgresql_hba_entries[`4`].auth_method | `md5` | What authentication method to to use for the users |

Read more about PostgreSQL configuration [here](https://github.com/geerlingguy/ansible-role-postgresql).
