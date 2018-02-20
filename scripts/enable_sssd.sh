#!/bin/bash

/bin/cp /opt/devops-tools/sssd.conf /etc/sssd/

users=`cat /etc/passwd | cut -d ":" -f 1  | tr "\n" ","`
sed -i "s/^filter_users.*/filter_users = ${users%?} /g" /etc/sssd/sssd.conf
chmod 0000600 /etc/sssd/sssd.conf
sudo auth-client-config -a -p sssd
service sssd restart

