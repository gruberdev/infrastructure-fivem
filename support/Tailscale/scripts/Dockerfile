FROM alpine:3.16 AS builder

ARG TAILSCALE_CHANNEL=${TAILSCALE_CHANNEL}
ARG TAILSCALE_VERSION=${TAILSCALE_VERSION}
ARG TAILSCALE_ARCH=${TAILSCALE_ARCH}

ENV CHANNEL=${TAILSCALE_CHANNEL}
ENV VERSION=${TAILSCALE_VERSION}
ENV ARCH=${TAILSCALE_ARCH}

RUN mkdir /build
WORKDIR /build
RUN apk add --no-cache curl tar

RUN curl -vsLo tailscale.tar.gz "https://pkgs.tailscale.com/${CHANNEL}/tailscale_${VERSION}_${ARCH}.tgz" && \
 tar xvf tailscale.tar.gz && \
 mv "tailscale_${VERSION}_${ARCH}/tailscaled" . && \
 mv "tailscale_${VERSION}_${ARCH}/tailscale" .

FROM alpine:3.16

ENV LOGINSERVER=https://login.tailscale.com

RUN apk add --no-cache iptables

COPY --from=builder /build/tailscale /usr/bin/
COPY --from=builder /build/tailscaled /usr/bin/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
