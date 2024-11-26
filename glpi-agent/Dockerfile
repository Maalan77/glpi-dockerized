
FROM debian:bookworm
LABEL org.opencontainers.image.authors="maalan77@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

ENTRYPOINT ["/opt/entrypoint.sh"]

RUN cd /tmp/ \
  && apt-get update -qqy \
  && apt-get upgrade -qqy \
# локаль
  && apt-get install -yqq  --no-install-recommends --no-install-suggests locales apt-utils

ENV LANG='ru_RU.UTF-8' LANGUAGE='ru_RU.UTF-8' LC_ALL='ru_RU.UTF-8'
RUN echo ru_RU.UTF-8 UTF-8 >> /etc/locale.gen && locale-gen

RUN cd /tmp/ \
 # timezone
  && ln -sf /usr/share/zoneinfo/Europe/Moscow  /etc/localtime && dpkg-reconfigure -f noninteractive tzdata \
 # install
  && apt-get update -qqy \
  && apt-get -y install \
    perl
RUN cd /tmp/ \
  && apt-get update -qqy \
  && apt-get -y install gnupg2 \
  && wget -O - https://github.com/glpi-project/glpi-agent/releases/download/1.11/glpi-agent-1.11-linux-installer.pl
  && perl glpi-agent-1.11-linux-installer.pl --server=${GLPI-AGENT-SERVER} --local=${GLPI-AGENT-LOCAL} \
  ## clean
  && apt-get autoremove -qqy \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/*

COPY entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh

