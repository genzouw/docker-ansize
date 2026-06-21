FROM golang:1.13.11-alpine3.10

LABEL maintainer "genzouw <genzouw@gmail.com>"

RUN apk add \
  --no-cache \
  git \
  && go get github.com/jhchen/ansize

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
