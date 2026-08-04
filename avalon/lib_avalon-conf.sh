#!/bin/sh

set -eu

case $DEPLOY_TO in
  Production) AVALON_ENVIRONMENT=avalon_prod ;;
  Test) AVALON_ENVIRONMENT=avalon_test ;;
  *) printf 'Invalid environment: %s\n' "$DEPLOY_TO"; exit 1 ;;
esac

printf 'DEPLOY_TO="%s"\n' "$DEPLOY_TO"
printf 'AVALON_ENVIRONMENT="%s"\n' "$AVALON_ENVIRONMENT"

/usr/bin/ansible-playbook \
	--diff \
	--limit "$AVALON_ENVIRONMENT" \
	--verbose \
	/etc/ansible/plays/avalon/lib_avalon-conf.yaml
