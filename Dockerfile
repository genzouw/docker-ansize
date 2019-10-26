FROM golang:1.13.3-alpine3.10

LABEL maintainer "genzouw <genzouw@gmail.com>"

RUN apk add \
  --no-cache \
  git \
  ;

RUN go get github.com/jhchen/ansize

ADD ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
