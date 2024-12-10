
FROM debian:bookworm
LABEL org.opencontainers.image.authors="maalan77@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

#RUN cd /tmp/ \
#  && ln -sf /usr/share/zoneinfo/Europe/Moscow  /etc/localtime && dpkg-reconfigure -f noninteractive tzdata \
#  && apt-get update -qqy \
#  && apt-get -y install software-properties-common \
#  && apt-add-repository contrib non-free-firmware \
#  && apt-get -y install snmp-mibs-downloader

RUN cd /tmp/ \
  && ln -sf /usr/share/zoneinfo/Europe/Moscow  /etc/localtime && dpkg-reconfigure -f noninteractive tzdata \
  && apt-get update -qqy \
  && apt-get -y install \
     perl \
     wget \
     curl \
     nano \
     ucf \
     libnet-cups-perl \
     libnet-ip-perl \
     libnet-ssh2-perl \
     libwww-perl \
     libparse-edid-perl \
     libproc-daemon-perl \
     libparallel-forkmanager-perl \
     libuniversal-require-perl \
     libfile-which-perl \
     libxml-libxml-perl \
     libyaml-perl \
     libtext-template-perl \
     libcpanel-json-xs-perl \
     pciutils \
     usbutils \
     libhttp-daemon-perl \
     libyaml-tiny-perl \ 
     libossp-uuid-perl \
     libdatetime-perl \
     libsocket-getaddrinfo-perl \
     libio-socket-ssl-perl \
     hdparm \
     fdisk \
     util-linux \
     net-tools \
     dmidecode \
     usb.ids \
     snmp \
     snmpd

COPY glpi-agent_1.11-1_all.deb /tmp/
COPY glpi-agent-task-network_1.11-1_all.deb /tmp/
COPY glpi-agent-task-collect_1.11-1_all.deb /tmp/

RUN cd /tmp/ \
  && apt-get update -qqy \
  && apt-get -y install \
     /tmp/glpi-agent_1.11-1_all.deb  \
     /tmp/glpi-agent-task-network_1.11-1_all.deb  \
     /tmp/glpi-agent-task-collect_1.11-1_all.deb

  ## clean
RUN apt-get autoremove -qqy \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/*

COPY run.sh /opt/
RUN chmod +x /opt/run.sh

CMD ["/opt/run.sh"]
