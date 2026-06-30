# Avalon 8

## Running

The docker containers are set to restart unless stopped. If the host is
rebooted, the containers will come back up.

## Configuration Deployment

If the configurations have been updated in the
[avalon8-dev](https://github.com/UCLALibrary/avalon8-dev "Avalon v8 UCLA
Development") repository, then the `lib_avalon-docker.yaml` playbook can
distribute them.

```bash
ansible-playbook /etc/ansible/plays/avalon/lib_avalon-conf.yaml \
  --limit avalon_test
```

Currently, limiting to the `avalon_test` group is important, as the playbook
isn't limited enough in scope to avoid the legacy Avalon 7 systems.

The containers should be force restarted after a configuration change.

```shell
ansible t-w-avalon01.library.ucla.edu \
  --args 'docker compose down' \
  --become \
  --become-user avalon
ansible t-w-avalon01.library.ucla.edu \
  --args 'docker compose up' \
  --become \
  --become-user avalon
```

## Servers

The Avalon 8 service is split among four hosts:

### Avalon

Runs the following:

- Avalon front end
- Avalon worker
- HTTP live streaming
- Redis

### Database

Runs the postgres container.

### Fedora

Runs the Fedora Commons repository

### Solr

Runs the Solr indexer

## Compose

The containers on a host are managed by a `compose.yaml` file that references a
unified `base.yaml` file. The base compose file is based strongly on the
upstream [avalon-docker](https://github.com/avalonmediasystem/avalon-docker
"Dockerfiles for Avalon Media
System")/[`docker-compose.yml`](https://raw.githubusercontent.com/avalonmediasystem/avalon-docker/refs/heads/main/docker-compose.yml
"Docker Compose (raw)").

## Playbooks

In order they should be applied (as best as I can remember):

- `lib_swap.yaml`
  Creates a swap partition on `/dev/sdb` which should exist already.
- `lib_docker.yml`
  Installs Docker Engine and creates dedicated service users.
- `lib_firewall.yaml`
  Updates the firewalls. Might have been done at Packer build if the firewall
was anabled in the host vars.
- `lib_mounts.yaml`
  Creates paritions for named volume mounts. Uses `/dev/sdc` through `/dev/sde`
as required for the named volumes. These drives must exist first.
- `lib_apache.yaml`
  Installs and configures Apache Webserver, Certbot, and Anubis. Basically
performs a "`lib_avalon.yaml`" function but with a different name.
- `lib_fedora.yaml`
  Installs Apache proxy.
- `lib_solr.yaml`
  Installs Apache proxy.
- `lib_avalon8.yml`
  Installs Docker compose files, environment, and bind mount volume data.
- `lib_avalon-conf.yaml`
  Installs the Avalon configurations from the avalon-dev repository.

## Starting

No playbook, _at this time_, actually starts the containers. It must be done
manually after all the above playbooks have been run.

```shell
docker compose up --detatch
```

From the Ansible controller:

```shell
ansible avalon_test -a 'sudo su - {{ docker_users[0] }} -c "docker compose up -d"'
```

Sadly, not enough time was permitted to allow making one "site.yaml" file to
complete the install, configuration, and service launching with complete
verification that required hardware was present.

