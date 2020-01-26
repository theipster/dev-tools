FROM alpine:3.11
LABEL maintainer "Alan Ip <theipster@users.noreply.github.com>"

ARG TAG

RUN addgroup -S kind && \
    adduser -u 1000 -D -H -S -G kind kind

RUN apk add --no-cache curl && \
    curl -Lo /usr/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/$TAG/kind-linux-amd64 && \
    chmod +x /usr/bin/kind

USER kind
ENTRYPOINT ["kind"]
CMD ["--help"]
