#!/bin/bash

# modify ssh config file: /etc/ssh/sshd_config
a=$(cat /etc/ssh/sshd_config | grep "^AuthorizedKeysCommand /usr/bin/sss_ssh_authorizedkeys" | wc -l)
b=$(cat /etc/ssh/sshd_config | grep "^AuthorizedKeysCommandUser nobody" | wc -l)
if [ "$a" -eq "0" ] && [ "$b" -eq "0" ];then
	echo " " >> /etc/ssh/sshd_config
	echo "AuthorizedKeysCommand /usr/bin/sss_ssh_authorizedkeys" >> /etc/ssh/sshd_config
	echo "AuthorizedKeysCommandUser nobody" >> /etc/ssh/sshd_config
fi

# add devops group in sudoers file
# check if group is already added:
c=$(cat /etc/sudoers | grep %devops | wc -l)
if [ "$c" -eq "0" ];then
	echo "%devops ALL=(ALL)  ALL"  >> /etc/sudoers
fi

d=$(cat /etc/sudoers | grep %dev-root | wc -l)
if [ "$c" -eq "0" ];then
        echo "%dev-root ALL=(ALL)  ALL"  >> /etc/sudoers
fi



service sshd restart
service sssd restart


