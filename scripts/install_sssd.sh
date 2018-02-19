#!/bin/bash

yum install -y sssd authconfig
yum remove nscd
chkconfig sssd on

# Enable SSSD 
authconfig --enablesssd --enablesssdauth --enablemkhomedir --update

#/bin/cp /opt/files/scripts/sssd.conf /etc/sssd/

