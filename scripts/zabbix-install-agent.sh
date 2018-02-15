#!/bin/bash
rpm -Uvh http://repo.zabbix.com/zabbix/3.2/rhel/6/x86_64/zabbix-release-3.2-1.el6.noarch.rpm
yum install -y zabbix-agent
yum -y install jq

chkconfig zabbix-agent on

/bin/sed -i 's/^Server=127.0.0.1/Server=zabbix.devopsteam.io/g' /etc/zabbix/zabbix_agentd.conf
/bin/sed -i 's/^ServerActive=127.0.0.1/ServerActive=zabbix.devopsteam.io/g' /etc/zabbix/zabbix_agentd.conf
/bin/sed -i 's/^Hostname=Zabbix server/#Hostname=Zabbix server/g' /etc/zabbix/zabbix_agentd.conf
/bin/sed -i 's/^# HostMetadata=/HostMetadata=gigi-test-eb/g' /etc/zabbix/zabbix_agentd.conf

/etc/init.d/zabbix-agent start
/etc/init.d/zabbix-agent restart

