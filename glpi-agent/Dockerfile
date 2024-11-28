
FROM debian:bookworm
LABEL org.opencontainers.image.authors="maalan77@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN cd /tmp/ \
  && ln -sf /usr/share/zoneinfo/Europe/Moscow  /etc/localtime && dpkg-reconfigure -f noninteractive tzdata \
  && apt-get update -qqy \
  && apt-get -y install perl wget

  ## clean
RUN apt-get autoremove -qqy \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/*

COPY entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]

