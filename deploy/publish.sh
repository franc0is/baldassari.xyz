#!/usr/bin/env bash
# Publish to the moulinsart `blog` project: ship Caddy binary + Caddyfile
# to the VM, deploy the launcher script as /opt/app/app via moulinsart,
# then rsync ./public/ to /opt/app/public/.
set -euo pipefail

cd "$(dirname "$0")/.."

PROJECT=blog
HOST=moulinsart-prod
VM=blog.baldassari.me
CADDY_VERSION=2.8.4
CADDY_BIN=/tmp/caddy-${CADDY_VERSION}-linux-amd64

echo "==> shipping Caddy binary + Caddyfile to ${VM}"
scp "${CADDY_BIN}" "${VM}:/opt/app/caddy.new"
scp deploy/Caddyfile "${VM}:/opt/app/Caddyfile"
ssh "${VM}" "chmod +x /opt/app/caddy.new && mv /opt/app/caddy.new /opt/app/caddy"

echo "==> moulinsart deploy ${PROJECT} (launcher script)"
scp deploy/launcher.sh "${HOST}:/tmp/${PROJECT}-launcher"
ssh "${HOST}" "moulinsart deploy ${PROJECT} /tmp/${PROJECT}-launcher"

echo "==> rsyncing ./public/ to ${VM}:/opt/app/public/"
rsync -azP --delete ./public/ "${VM}:/opt/app/public/"

echo "==> done. https://${VM}/"
