
## Top level

### .travis.yml
TravisCI tests

### devsupport_bootstrap.yml

Roles:
* `uclalib_role_rhel7repos`

Applicable hosts:
* New developer VMs

### iiif_images.yml
Sets up IIIF server

Roles:
* `uclalib_role_iiifimages`
* `uclalib_role_iptables`
* `uclalib_role_cifsmount`
* `uclalib_role_nfsmount`

Applicable hosts:

### install_rhel_insights.yml

Roles:
* `uclalib_role_rhelinsights`

Applicable hosts:

### ndlcinfo.yml

Roles:
* `uclalib_role_ndlcinfo`
* `uclalib_role_iptables` Allow 80(http) from the world (0.0.0.0/0)

Applicable hosts:
* `webservers`

### sinai_scholars.yml

Roles:
* `uclalib_role_sinaischolars`
* `uclalib_role_iptables` Allow 22(ssh), 80(http), 443(https)

### uclalib_ansible_capdeploy.yml
Deploys (rails) app via Capistrano, called via Jenkins

Applicable hosts:
* Rails/Samvera systems

### uclalib_cantaloupeiiif.yml
Installs Cantaloupe

Roles:
* `uclalib_role_rhel7repos`
* `uclalib_role_epel`
* `uclalib_role_uclalibrepo`
* `uclalib_role_java`
* `uclalib_role_apache`
* `uclalib_role_tomcat`
* `uclalib_role_cantaloupe`

Applicable hosts:

### uclalib_clearcache_cantaloupe.yml
Removes cached images, info, source from Cantaloupe server

Applicable hosts:

### uclalib_customfacts.yml

Roles:
* uclalib_role_custom_facts

Applicable hosts:

### uclalib_dlp_users.yml

Roles:
* uclalib_role_users

Applicable hosts:

### uclalib_dockerce.yml

Roles:
* `uclalib_role_docker-ce`

Applicable hosts:
* Developer workstations (?)

### uclalib_dspace.yml
DuraSpace (now part of LYRASIS)

Roles:
* uclalib_role_java
* uclalib_role_vim
* uclalib_role_imagemagick
* uclalib_role_clamav
* uclalib_role_java_maven
* uclalib_role_java_ant
* uclalib_role_git
* uclalib_role_postgres (if local testing)
* uclalib_role_apache
* uclalib_role_tomcat
* uclalib_role_dspace
* uclalib_role_handle
* uclalib_role_iptables (if VMware) 80(http), 8081(tomcat), 8082(tomcat ?) from UCLA

Applicable hosts:
* Local developer workstation
* Production DuraSpace

### uclalib_execute_rake.yml
Execute arbitrary rake task(`rake_task`) for arbitrary Rails application `project_name`

Applicable hosts:
* Samvera

### uclalib_fedora4test.yml

Roles:
* `uclalib_role_java`
* `uclalib_role_apache`
* `uclalib_role_tomcat`
* `uclalib_role_fedora4`
* `uclalib_role_iptables` 61616(?) UCLA Library(?)

Applicable hosts:

### uclalib_fedoracamel.yml

Roles:
* `uclalib_role_java`
* `uclalib_role_karaf`
* `uclalib_role_fedoracamel`

Applicable hosts:

### uclalib_git.yml

Roles:
* `uclalib_role_git`

### uclalib_haproxy_solr4prod.yml uclalib_haproxy_solr4test.yml
Configure SOLR Load Balancers

Roles:
* `uclalib_role_haproxy`

Applicable hosts:
* `solr_lb`

### uclalib_karaf.yml

Roles:
* `uclalib_role_java`
* `uclalib_role_karaf`

Applicable hosts:
* `karaf4`

### uclalib_ldse_users.yml

Roles:
* `uclalib_role_users`

Applicable hosts:

### uclalib_netdata.yml

Roles:
* `uclalib_role_netdata`

Applicable hosts:

### uclalib_postgres.yml
PostgreSQL server for DuraSpace

Roles:
* `uclalib_role_postgres`

Applicable hosts:


### uclalib_rhelfirstbootaws.yml
### uclalib_rhelfirstbootvmware.yml
### uclalib_rhelinsights.yml
### uclalib_rhelreboot.yml
### uclalib_rhelscl.yml
### uclalib_rhelupdate.yml
### uclalib_rhelupdatedownload.yml
### uclalib_services_cantaloupe.yml
### uclalib_solr4prod.yml
### uclalib_solr4test.yml
### uclalib_swarmstackdeploy.yml
### uclalib_tomcat.yml
### uclalib_travisdeploy.yml
### uclalib_webservicewardeploy.yml
### uclalib_yum_repo.yml



## avalon

### avalon/lib_fedora.yml
### avalon/lib_matterhorn.yml
### avalon/lib_solr.yml
### avalon/lib_web.yml

## bucketeer

### bucketeer/deploy.yml

## californica

### californica/uclalib_californica_backup.yml
### californica/uclalib_californica_refresh.yml
### californica/uclalib_californica_restore.yml
### californica/uclalib_californicafedora.yml
### californica/uclalib_californicamysql.yml
### californica/uclalib_californicasolr.yml
### californica/uclalib_californicaweb.yml


## elastical

### elastical/provision.yml

## sandbox

### sandbox/www.library.ucla.edu/localdev-build.yml
### sandbox/www.library.ucla.edu/requirements.yml

## sinaimanuscripts

### sinaimanuscripts/uclalib_sinaimanumysql.yml
### sinaimanuscripts/uclalib_sinaimanusolr.yml
### sinaimanuscripts/uclalib_sinaimanuweb.yml


## ursus

### ursus/uclalib_ursusmysql.yml
### ursus/uclalib_ursussolr.yml
### ursus/uclalib_ursusweb.yml

## vars

### vars/dspace_vars_open.yml
### vars/dspace_vars_private.yml
### vars/fctools_vars.yml
### vars/iptables_library_campusvpn_port443.yml
### vars/iptables_library_campusvpn_port80.yml
### vars/travis-builds/postgres-check.yml

## wapiti

### wapiti/provision.yml

## www_library

### www_library/drupal_backup.yml
### www_library/drupal_codedeploy.yml
### www_library/drupal_deploy_post.yml
### www_library/drupal_deploy_pre.yml
### www_library/drupal_www_purge.yml
### www_library/drupal_www_refresh.yml
### www_library/lib_webservers.yml
### www_library/uclalib_memcacheservers.yml
