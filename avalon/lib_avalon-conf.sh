#!/bin/sh

set -eu

/usr/bin/ansible-playbook \
	--check \
	--diff \
	--limit t-w-avalon01.library.ucla.edu \
	--verbose \
	/etc/ansible/plays/avalon/lib_avalon-conf.yaml
