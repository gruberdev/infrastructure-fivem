#!/bin/bash
apt update
apt upgrade
apt install -y curl
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
curl -sLS https://dl.get-arkade.dev |  sh
arkade get kubectl
arkade get terraform
arkade get helm
arkade get docker-compose
mv /root/.arkade/bin/docker-compose /usr/local/bin/
mv /root/.arkade/bin/kubectl /usr/local/bin/
mv /root/.arkade/bin/terraform /usr/local/bin/
mv /root/.arkade/bin/helm /usr/local/bin/