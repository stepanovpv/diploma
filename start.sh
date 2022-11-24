#!/bin/bash


inventory=/home/deploy/ansible_cm1/inventory/hosts.ini


ansible-playbook playbook.yml -i $inventory -kK -u deploy -vv "$@"
