FROM alpine:3.8

MAINTAINER Yannik Korzikowski <yannik@korzikowski.de>

# data should be mounted with a directory container your PDF's
VOLUME ["/pdf"]

RUN apk --no-cache add \
  sed \
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

WORKDIR /pdf

CMD ["/scripts/entry"]
