FROM azul/zulu-openjdk-alpine:11.0.5 as packager

# second stage add node and app
FROM node:12-alpine3.10

COPY --from=packager /usr/lib/jvm/zulu11 /opt/jdk11
# create user with defined user-id and set rights to volume for user
ENV JAVA_HOME=/opt/jdk11
ENV PATH="$PATH:$JAVA_HOME/bin"

## provide app details
ARG APP_DIR="/app"
ENV GIT_CREDENTIALS="Unknown:Unknown"

RUN apk add --no-cache git openssh ca-certificates && \
  npm install -g semantic-release@15.13.31 && \
  npm install -g @semantic-release/changelog && \
  npm install -g @semantic-release/git && \
  npm install -g @semantic-release/release-notes-generator && \
  npm install -g @semantic-release/exec && \
  npm install -g gradle-semantic-release-plugin

## add local certificates if required here 
# COPY local-certs/*.pem /usr/local/share/ca-certificates/
# COPY local-certs/cacerts /etc/ssl/certs/java/
# COPY local-certs/cacerts /opt/jdk11/lib/security/

RUN update-ca-certificates
RUN mkdir -p /app && \
  chown node:node -Rf /app

## switch user
User node:node

WORKDIR $APP_DIR

CMD ["semantic-release --dry-run --debug"]
