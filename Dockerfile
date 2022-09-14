  FROM caddy:builder AS builder

  RUN caddy-builder \
  github.com/caddy-dns/cloudflare github.com/lindenlab/caddy-s3-proxy

  FROM caddy:latest

  COPY --from=builder /usr/bin/caddy /usr/bin/caddy
