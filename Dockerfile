FROM ubuntu:19.10

LABEL maintainer "genzouw <genzouw@gmail.com>"

env GOPATH /usr/lib/x86_64-linux-gnu/go

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get -y install \
    --no-install-recommends \
    ca-certificates \
    gccgo-go \
    git \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN go get github.com/jhchen/ansize

# ADD ./docker-entrypoint.sh /
# ENTRYPOINT ["/docker-entrypoint.sh"]
