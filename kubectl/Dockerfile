FROM alpine:3.11
LABEL maintainer "Alan Ip <theipster@users.noreply.github.com>"

ARG TAG

RUN apk add --no-cache curl && \
    curl -Lo /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$TAG/bin/linux/amd64/kubectl && \
    chmod +x /usr/bin/kubectl

RUN addgroup -S kubectl && \
    adduser -u 1000 -D -S -G kubectl kubectl

USER kubectl
ENTRYPOINT ["/usr/bin/kubectl"]
CMD ["--help"]
