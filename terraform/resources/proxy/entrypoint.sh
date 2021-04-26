#!/usr/bin/env sh
set -eu

envsubst '${REMOTE} ${LOCAL_ENDPOINT_PORT} ${LOCAL_ENDPOINT_IP}' </etc/nginx/conf.d/default.conf.template >/etc/nginx/conf.d/default.conf
envsubst '${REMOTE}' </etc/nginx/stream.conf.template >/etc/nginx/stream.conf
exec "$@"
