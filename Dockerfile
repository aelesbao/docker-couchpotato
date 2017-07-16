## -*- docker-image-name: "docker-couchpotato" -*-
#
# CouchPotato Dockerfile
# https://github.com/aelesbao/docker-couchpotato
#

FROM alpine:3.6

LABEL maintainer="Augusto Elesbao <https://github.com/aelesbao>"

# Set python to use UTF-8 rather than AscII
ENV PYTHONIOENCODING "UTF-8"

WORKDIR /opt/couchpotato

RUN addgroup couchpotato && adduser -G couchpotato -D -h /opt/couchpotato couchpotato

# Install run dependencies
RUN apk add --no-cache --virtual .run-deps \
      su-exec \
      openssl \
      py2-pip \
      py2-lxml \
      py2-openssl \
      py2-parsing \
      py2-packaging

# Install CouchPotato
ARG git_ref="build/3.0.1"
RUN set -ex \
  && apk add --no-cache --virtual .build-deps \
      wget \
      tar \
  && wget --no-check-certificate -O /tmp/couchpotato.tar.gz "https://github.com/CouchPotato/CouchPotatoServer/archive/${git_ref}.tar.gz" \
  && mkdir ./server ./data ./downloads ./movies \
  && tar -zxvf /tmp/couchpotato.tar.gz -C ./server --strip-components=1 \
  && rm -rf /tmp/* \
  && apk del .build-deps

ENV PATH /opt/couchpotato/server:$PATH

VOLUME ["/opt/couchpotato/data", "/opt/couchpotato/downloads", "/opt/couchpotato/movies"]

EXPOSE 5050

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["CouchPotato.py", "--console_log", "--data_dir", "./data"]
