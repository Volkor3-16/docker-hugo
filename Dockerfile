FROM alpine:latest

MAINTAINER JG <julien@mangue.eu>

RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync

ENV VERSION 0.59.1
RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \

    && curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/local/bin/hugo \

    && curl -L https://github.com/tdewolff/minify/releases/download/v2.5.2/minify_2.5.2_linux_amd64.tar.gz | tar -xz \
    && mv minify /usr/local/bin/ \

    && addgroup -Sg 1000 hugo \
    && adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

EXPOSE 1313
