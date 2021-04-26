#!/bin/bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
curl -sLS https://dl.get-arkade.dev | sh
arkade get kubectl
arkade get docker-compose
export LOCAL_ENDPOINT_IP="$(hostname -I | cut -f1 -d' ')"
export REMOTE=${TAILSCALE_IP}:30120
mv /root/.arkade/bin/docker-compose /usr/local/bin/
curl -fsSL https://pkgs.tailscale.com/stable/debian/buster.gpg | sudo apt-key add -
curl -fsSL https://pkgs.tailscale.com/stable/debian/buster.list | sudo tee /etc/apt/sources.list.d/tailscale.list
apt-get update
apt-get install tailscale
tailscale up -authkey ${TAILSCALE_TOKEN}
cd /tmp && docker-compose up --build -d
