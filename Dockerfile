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

RUN adduser --uid 1000 --disabled-password --home /app pdf

ADD scripts/* /app/
ADD README.md /
env PATH /scripts:$PATH

USER pdf

WORKDIR /app

CMD ["/scripts/entry"]
