# CouchPotato Docker image

[![Docker Pulls](https://img.shields.io/docker/pulls/aelesbao/couchpotato.svg)](https://hub.docker.com/r/aelesbao/couchpotato/)
[![Docker Stars](https://img.shields.io/docker/stars/aelesbao/couchpotato.svg)](https://hub.docker.com/r/aelesbao/couchpotato/)

[CouchPotato](http://couchpota.to) is an automatic NZB and torrent downloader.
You can keep a "movies I want"-list and it will search for NZBs/torrents of
these movies every X hours. Once a movie is found, it will send it to SABnzbd
or download the torrent to a specified directory.

## Docker image

The image is based on Alpine Linux 3.6 and uses Python 2.7. It clones
CouchPotatoServer `master` branch, but it is possible to change the `git-ref`
at build time using a special argument.

### Build

```
docker build -t aelesbao/couchpotato .
```

To use a different git branch or tag when building the image:

```
docker build --build-arg git_ref=build/3.0.1 -t aelesbao/couchpotato:3.0.1 .
```

### Run

```
docker run --name couchpotato \
  -v /opt/couchpotato/data \
  -v /opt/couchpotato/downloads \
  -v /opt/couchpotato/movies \
  -p 5050:5050 \
  aelesbao/couchpotato
```
