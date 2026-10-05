FROM golang:1.27.1-alpine3.24 AS builder

# ansize は go.mod を持たないため、モジュールモードでビルドできるよう手元で初期化する
# 上流（jhchen/ansize）は更新が止まっているため、確認済みのコミットに固定して再現性を確保する
ARG ANSIZE_REF=3bb41b2dc6e6e4b217b99c29d868fe8329d211ed

RUN apk add \
  --no-cache \
  git \
  && git init /src \
  && git -C /src fetch --depth 1 https://github.com/jhchen/ansize "${ANSIZE_REF}" \
  && git -C /src checkout FETCH_HEAD

WORKDIR /src

RUN go mod init github.com/jhchen/ansize \
  && go mod tidy \
  && CGO_ENABLED=0 go build -o /go/bin/ansize .

FROM alpine:3.24

LABEL maintainer "genzouw <genzouw@gmail.com>"

COPY --from=builder /go/bin/ansize /go/bin/ansize
COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
