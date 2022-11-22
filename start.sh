#!/bin/bash


inventory=/home/pavel/wp-mysql-nginx-php/inventory/hosts.ini


ansible-playbook playbook.yml -i $inventory -kK --ask-vault-pass -u pavel -vv "$@"
