FROM ubuntu:latest
LABEL org.opencontainers.image.source https://github.com/fourdollars/playit-bedrock
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /opt/bedrock
RUN <<EOF
  set -e
  apt-get update
  apt-get full-upgrade --yes
  apt-get install --yes ca-certificates curl gnupg jq unzip
  BEDROCK=$(curl -fsSL 'https://net-secondary.web.minecraft-services.net/api/v1.0/download/links' | jq -r '.result.links[] | select(.downloadType == "serverBedrockLinux") | .downloadUrl')
  curl -fsSL -A "Mozilla/5.0" "${BEDROCK}" --output bedrock-server.zip
  unzip bedrock-server.zip
  rm -f bedrock-server.zip bedrock_server_symbols.debug
  mkdir -p /etc/apt/keyrings/
  curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor -o /etc/apt/keyrings/playit.gpg
  echo "deb [signed-by=/etc/apt/keyrings/playit.gpg] https://playit-cloud.github.io/ppa/data ./" > /etc/apt/sources.list.d/playit-cloud.list
  apt-get update
  apt-get install --yes playit
  rm -fr /var/lib/apt
  echo "${BEDROCK} with $(dpkg-query -W playit)"
EOF
