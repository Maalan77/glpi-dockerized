#!/bin/bash

FOLDER_CONF=/etc/glpi-agent

# если ничего не установлено - устанавливаем
if [ "$(ls ${FOLDER_CONF})" ];
then
        echo "GLPI agent is already installed"
else
        cd /opt/

        SRC_GLPI=$(curl -s https://api.github.com/repos/glpi-project/glpi-agent/releases/latest | grep browser_download_url | grep '\.pl' | grep -v snap | cut -d '"' -f 4)

        PL_GLPI=agent.pl
        wget ${SRC_GLPI} -O ${PL_GLPI}
        perl ${PL_GLPI} --server=http://glpi/ --local=/opt/agent/inventory --logfile=/opt/agent/log --service=0 --cron=0
        rm ${PL_GLPI}
fi

## IPv6 disable
sysctl net.ipv6.conf.all.disable_ipv6=0

service cron start
trap "service cron stop; service rsyslog stop; exit" SIGINT SIGTERM

# разрешения

/usr/bin/glpi-agent --daemon
