FROM debian:unstable
MAINTAINER busti <busti+oss@busti.cool>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt install -y --force-yes --no-install-recommends \
    reprepro \
    inotify-tools \
 && apt-get autoclean \
 && apt-get autoremove \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ADD distributions.conf ./htdocs/apt/conf/distributions
ADD startup.sh .

VOLUME /data
ENTRYPOINT ["bash", "/app/startup.sh"]