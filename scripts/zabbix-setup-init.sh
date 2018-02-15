#!/bin/bash

/bin/cp /opt/files/zabbix-delete-host.sh /etc/init.d

/etc/init.d/zabbix-delete-host.sh start

# create symlinks:
/bin/ln -sf /etc/init.d/zabbix-delete-host.sh /etc/rc0.d/K15Remove-Zabbix
/bin/ln -sf /etc/init.d/zabbix-delete-host.sh /etc/rc3.d/S86Remove-Zabbix

