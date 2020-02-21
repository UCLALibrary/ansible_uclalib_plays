#!/bin/bash

cd /etc/ansible || exit 1

limit="$GROUP"
if [[ "$GROUP" == "SPECIFY" ]]; then
  if [[ -z $HOSTS ]]; then
    echo "Error in build parameters: HOSTS must be specified"
    exit 1
  fi
  limit="$HOSTS"
elif [[ -n $HOSTS ]]; then
  echo "Error in build paramerters: HOSTS must be blank"
  echo "or GROUP must be SPECIFY"
  exit 1
fi

ansible-playbook \
  plays/uclalib_vmware_snapshot.yml \
  -l "$limit" \
  -e remove_snapshot="$REMOVE_SNAPS" \
  -e days_to_keep_snapshots="${AGE:-7}" \
  -v
