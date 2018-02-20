#!/bin/bash

yum install -y sssd authconfig
yum remove nscd
chkconfig sssd on

# Enable SSSD 
authconfig --enablesssd --enablesssdauth --enablemkhomedir --update


