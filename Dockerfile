FROM debian:unstable
MAINTAINER busti <busti+oss@busti.cool>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt install -y --force-yes --no-install-recommends \
    reprepro \
    inotify-tools \
    nginx \
 && apt-get autoclean \
 && apt-get autoremove \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ADD config.nginx /etc/nginx/sites-enabled/default
ADD distributions.conf ./htdocs/apt/conf/distributions
ADD startup.sh .

EXPOSE 80
VOLUME /data
ENTRYPOINT ["/startup.sh"]