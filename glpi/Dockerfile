FROM debian:bookworm
#FROM debian:buster
#FROM debian:stretch
#MAINTAINER Sergey Ershov "ershovu@gmail.com"
LABEL org.opencontainers.image.authors="ershovu@gmail.com,maalan77@gmail.com"

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
    apache2 \
    php \
    php-mysql \
    php-ldap \
    php-xmlrpc \
    php-imap \
    curl \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
#    php-apcu-bc \
    php-cas \
    php-zip \
    cron \
    rsyslog \
    wget \
    graphviz \
    php-snmp \
    php-intl \
    php-bz2
RUN cd /tmp/ \
  && apt-get update -qqy \
  && apt-get -y install gnupg2 bzip2 \
  ## clean
  && apt-get autoremove -qqy \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/*

COPY entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh
