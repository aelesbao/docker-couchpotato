# CouchPotato Docker image

[CouchPotato](http://couchpota.to) is an automatic NZB and torrent downloader.
You can keep a "movies I want"-list and it will search for NZBs/torrents of
these movies every X hours. Once a movie is found, it will send it to SABnzbd
or download the torrent to a specified directory.

## Docker image

The image is based on Alpine Linux 3.6 and uses Python 2.7. It installs
CouchPotato `build/3.0.1` tag, but it is possible to change the git-ref at
build time using a special argument.

### Build

```
docker build -t aelesbao/couchpotato .
```

To use a different Github commit when building the image:

```
docker build --build-arg git_ref=master -t aelesbao/couchpotato .
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
