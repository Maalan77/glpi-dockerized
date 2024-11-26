
FROM perl:stable-bookworm
LABEL org.opencontainers.image.authors="maalan77@gmail.com"

RUN cd /tmp/ \
  && apt-get update -qqy \
  && wget -O https://github.com/glpi-project/glpi-agent/releases/download/1.11/glpi-agent-1.11-linux-installer.pl
  && perl glpi-agent-1.11-linux-installer.pl --server=${GLPI-AGENT-SERVER} --local=${GLPI-AGENT-LOCAL} \
  ## clean
  && apt-get autoremove -qqy \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/*

WORKDIR /usr/src/glpi-agent

CMD [ "perl", "-v" ]

