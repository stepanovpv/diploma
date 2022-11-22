#!/bin/bash

inventory=/home/deploy/ansible-wordpress/inventory/hosts.ini

ansible-playbook playbook.yml -i $inventory -kK --ask-vault-pass -u deploy -vv "$@"
