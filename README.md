# caddy_s3_cf
This repo contains dockerfiles for Caddy with s3 module and Cloudflare DNS challenge module built in. I host this on github to use the actions feature to automatically build the dockerfile when I am notified of upstream changes.

## What Is It?
This is Caddy V2 Latest (https://hub.docker.com/_/caddy) with caddy-S3-Proxy (https://github.com/lindenlab/caddy-s3-proxy) as well as Cloudflare (https://hub.docker.com/r/cloudflare/cloudflared) plugins enabled.

I update this whenever the official Caddy image is updated.

## Is This Safe?
Of course it is, but never trust a man with a pair of scissors. Its really easy to do this yourself;

Create a Dockerfile with;

      FROM caddy:builder AS builder

      RUN caddy-builder \
      github.com/caddy-dns/cloudflare github.com/lindenlab/caddy-s3-proxy

      FROM caddy:latest

      COPY --from=builder /usr/bin/caddy /usr/bin/caddy
      
Then either reference this with the build tag in your docker-compose.yaml ie

      build:
           context: .
           dockerfile: Dockerfile
Or deploy this to your own docker repository.
