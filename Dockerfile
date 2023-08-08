# syntax=docker/dockerfile:1.4
FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /opt/bedrock
RUN <<EOF
  apt-get update
  apt-get full-upgrade --yes
  apt-get install --yes ca-certificates curl gnupg unzip
  BEDROCK=$(curl -fsSL 'https://www.minecraft.net/en-us/download/server/bedrock' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64)' | grep -o "https://.*/bin-linux/.*bedrock-server-.*.zip")
  curl -sSL "${BEDROCK}" > bedrock-server.zip
  unzip bedrock-server.zip
  rm bedrock-server.zip
  mkdir -p /etc/apt/keyrings/
  curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor -o /etc/apt/keyrings/playit.gpg
  echo "deb [signed-by=/etc/apt/keyrings/playit.gpg] https://playit-cloud.github.io/ppa/data ./" > /etc/apt/sources.list.d/playit-cloud.list
  apt-get update
  apt-get install --yes playit
  rm -fr /var/lib/apt
  echo "${BEDROCK} with $(dpkg-query -W playit)"
EOF
