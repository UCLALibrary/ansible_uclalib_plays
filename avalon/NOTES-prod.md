# Installing Prod Setup.

Verified order:

1. `lib_swap.yaml`
2. `lib_mounts.yaml`
3. `lib_docker.yml` Fails on pre-install check, as Docker repo isn't installed
4. `lib_firewall.yaml` Not sure this was necessary; set up at build time
5. `lib_apache.yaml` Certbot role fails pre-instal check. "[uclalib role certbot : Stop process bound to port 80]"
6. `lib_fedora.yaml`
7. `lib_solr.yaml`
8. `lib_avalon8.yaml`
9. `lib_avalon-conf.yaml` Fails on pre-install checks, rsync missing

Manually started the containers via:

1. `ssh`
2. `sudo service-account`
3. `docker compose up -d`
