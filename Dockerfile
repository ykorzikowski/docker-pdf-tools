FROM alpine:latest

MAINTAINER Yannik Korzikowski <yannik@korzikowski.de>

# data should be mounted with a directory container your PDF's
RUN mkdir /data
VOLUME ["/data"]

RUN apk update
RUN apk add \
  pdftk \
  ghostscript \
  imagemagick \
  bash \
  ghostscript-fonts

RUN rm -rf /var/cache/apk/*

RUN mkdir /scripts
ADD scripts/* /scripts/
ADD README.md /
env PATH /scripts:$PATH

WORKDIR /data

CMD ["/scripts/entry"]
