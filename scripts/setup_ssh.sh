#!/bin/bash

/bin/cp /opt/files/scripts/sssd.conf /etc/sssd/

echo "AuthorizedKeysCommand /usr/bin/sss_ssh_authorizedkeys" >> /etc/ssh/sshd_config
echo "AuthorizedKeysCommandUser nobody" >> /etc/ssh/sshd_config

# add devops group in sudoers file
echo "%devops ALL=(ALL)  ALL"  >> /etc/sudoers

service sshd restart
service sssd restart

