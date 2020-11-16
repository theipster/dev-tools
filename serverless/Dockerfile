FROM node:alpine
LABEL maintainer "Alan Ip <theipster@users.noreply.github.com>"

# Create user
RUN addgroup -S serverless && \
    adduser -u 1001 -D -S -G serverless serverless

# Install Serverless Framework
ARG TAG
RUN npm install -g serverless@$TAG serverless-cloudformation-sub-variables

# Set defaults
USER serverless
WORKDIR /home/serverless

# Initialise Serverless config, e.g. .serverlessrc
RUN serverless > /dev/null

ENTRYPOINT ["serverless"]
