#!/bin/sh

set -eu

case $DEPLOY_TO in
  main) AVALON_ENVIRONMENT=avalon_prod ;;
  *) AVALON_ENVIRONMENT=avalon_test ;;
esac

printf 'DEPLOY_TO="%s"\n' "$DEPLOY_TO"
printf 'AVALON_ENVIRONMENT="%s"\n' "$AVALON_ENVIRONMENT"

/usr/bin/ansible-playbook \
	--check \
	--diff \
	--limit "$AVALON_ENVIRONMENT" \
	--verbose \
	/etc/ansible/plays/avalon/lib_avalon-conf.yaml
