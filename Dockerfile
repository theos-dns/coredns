FROM golang:1.22-alpine AS builder

WORKDIR /root/go/
COPY . .
RUN apk --no-cache add make git gcc libtool musl-dev ca-certificates dumb-init curl
RUN make


FROM alpine:3.17
LABEL org.opencontainers.image.source="https://github.com/theos-dns/coredns"

RUN apk add --no-cache ca-certificates && update-ca-certificates

WORKDIR /root/app

COPY --from=builder --chmod=777 /root/go/coredns ./coredns

ENTRYPOINT ["/root/app/coredns"]

