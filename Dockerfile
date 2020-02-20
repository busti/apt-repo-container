FROM debian:unstable
MAINTAINER busti <busti+oss@busti.cool>

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y --force-yes --no-install-recommends \
    reprepro \
    inotify-tools \
    nginx \
 && apt autoclean \
 && apt autoremove \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ADD config.nginx /etc/nginx/sites-enabled/default
ADD distributions.conf ./htdocs/apt/conf/distributions
ADD startup.sh .

VOLUME /data
ENTRYPOINT ["/startup.sh"]