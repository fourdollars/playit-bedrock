# syntax=docker/dockerfile:1.4
FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
ENV BEDROCK_VERSION=1.19.20.02
WORKDIR /opt/bedrock
RUN <<EOF
  apt-get update
  apt-get full-upgrade --yes
  apt-get install --yes ca-certificates curl gnupg unzip
  curl -SsL https://minecraft.azureedge.net/bin-linux/bedrock-server-${BEDROCK_VERSION}.zip > bedrock-server.zip
  unzip bedrock-server.zip
  mkdir -p /etc/apt/keyrings/
  curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor -o /etc/apt/keyrings/playit.gpg
  echo "deb [signed-by=/etc/apt/keyrings/playit.gpg] https://playit-cloud.github.io/ppa/data ./" > /etc/apt/sources.list.d/playit-cloud.list
  apt-get update
  apt-get install --yes playit
EOF
