FROM debian:unstable
MAINTAINER busti <busti+oss@busti.cool>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt install -y --force-yes --no-install-recommends \
    reprepro \
    inotify-tools \
 && apt-get autoclean \
 && apt-get autoremove \
 && rm -rf /var/lib/apt/lists/*

VOLUME /in
VOLUME /out

WORKDIR /app
ADD distributions.conf ./apt/conf/distributions
ADD startup.sh .

ENTRYPOINT ["bash", "/app/startup.sh"]