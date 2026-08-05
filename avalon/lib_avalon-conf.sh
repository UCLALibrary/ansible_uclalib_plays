#!/bin/sh

set -eu

case $DEPLOY_TO in
  Production) AVALON_ENVIRONMENT=avalon_prod;
	 printf 'Job disabled.\n'; exit 0 ;;
  Test) AVALON_ENVIRONMENT=avalon_test ;;
  *) printf 'Invalid environment: %s\n' "$DEPLOY_TO"; exit 1 ;;
esac

printf 'I: DEPLOY_TO="%s"\n' "$DEPLOY_TO"
printf 'I: BRANCH="%s"\n' "$BRANCH"
printf 'I: AVALON_ENVIRONMENT="%s"\n' "$AVALON_ENVIRONMENT"

if [ "$DEPLOY_TO" = "Production" ] && [ "$BRANCH" != "main" ]; then
  printf '\nE: Cravenly refusing to push %s to %s.\nExiting.\n' \
    "$BRANCH" \
    "$DEPLOY_TO"
  exit 1
fi

/usr/bin/ansible-playbook \
	--extra-vars "avalon_conf_version=$BRANCH" \
	--diff \
	--limit "$AVALON_ENVIRONMENT" \
	--verbose \
	/etc/ansible/plays/avalon/lib_avalon-conf.yaml
