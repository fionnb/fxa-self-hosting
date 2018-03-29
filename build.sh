#!/bin/bash

echo Pulling Docker base images

# For fxa-auth-db-mysql,fxa-auth-server,fxa-content-server,fxa-oauth-server,fxa-profile-server:
docker pull node:6.14.0-alpine
docker build -t fionnb/fxa-slim-image https://github.com/fionnb/fxa-slim-image.git

# For browserid-verifier:
# docker pull node:4.2.4

# For syncserver:
docker pull debian:jessie-slim

# For syncserver:
docker pull python:2.7-slim

# For fxa-self-hosting:
#docker pull nginx

echo Building images...

docker build -f ./docs/self-host.docker -t fxa-content-server https://github.com/mozilla/fxa-content-server.git
docker build -f ./docs/self-host.docker -t fxa-auth-server https://github.com/mozilla/fxa-auth-server.git
docker build -f ./docs/self-host.docker -t fxa-auth-db-mysql https://github.com/mozilla/fxa-auth-db-mysql.git
docker build -f ./docs/self-host.docker -t fxa-oauth-server https://github.com/mozilla/fxa-oauth-server.git
docker build -t browserid-verifier https://github.com/mozilla/browserid-verifier.git#docker-improvements
docker build -f ./docs/self-host.docker -t fxa-profile-server https://github.com/mozilla/fxa-profile-server.git
docker build -t syncserver https://github.com/mozilla-services/syncserver.git
docker build -t syncto https://github.com/mozilla-services/syncto.git
#docker build -t fxa-self-hosting https://github.com/michielbdejong/fxa-self-hosting.git
