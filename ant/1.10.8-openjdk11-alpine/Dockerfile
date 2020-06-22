FROM alpine:3.11
LABEL maintainer "Alan Ip <theipster@users.noreply.github.com>"

RUN apk add --no-cache openjdk11 apache-ant

RUN addgroup -S ant && \
    adduser -u 1000 -D -S -G ant ant

USER ant
WORKDIR /ant
ENTRYPOINT ["ant"]
