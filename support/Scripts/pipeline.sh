#!/bin/bash
cd .. && \
cd Tailscale && \
docker-compose down || true && \
docker-compose up --build -d || true && \
cd .. && \
cd Drone && \
docker-compose down || true && \
docker-compose up --build -d && \
arkade get kubectl && \
export PATH=$PATH:$HOME/.arkade/bin