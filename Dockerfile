FROM golang:1.27.1-alpine3.24 AS builder

# ansize は go.mod を持たないため、モジュールモードでビルドできるよう手元で初期化する
RUN apk add \
  --no-cache \
  git \
  && git clone --depth 1 https://github.com/jhchen/ansize /src

WORKDIR /src

RUN go mod init github.com/jhchen/ansize \
  && go mod tidy \
  && CGO_ENABLED=0 go build -o /go/bin/ansize .

FROM alpine:3.24

LABEL maintainer "genzouw <genzouw@gmail.com>"

COPY --from=builder /go/bin/ansize /go/bin/ansize
COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
