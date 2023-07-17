# syntax=docker/dockerfile:1.6
FROM golang:1.18-alpine3.17 AS build

WORKDIR /go/src/github.com/gliderlabs/registrator/
COPY . .

ARG VERSION
RUN --mount=type=cache,target=/go/pkg/ CGO_ENABLED=0 go build -ldflags "-X main.Version=${VERSION}"

FROM alpine:3.17 AS registrator

COPY --from=build /go/src/github.com/gliderlabs/registrator/registrator /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/registrator"]
