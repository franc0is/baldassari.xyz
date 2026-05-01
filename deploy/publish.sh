#!/usr/bin/env bash
# Publish build artifacts to the moulinsart `blog` project on prod.
# Expects ./public/ and /tmp/blog-server to already exist (run build.sh first).
set -euo pipefail

cd "$(dirname "$0")/.."

PROJECT=blog
HOST=moulinsart-prod
VM=blog.baldassari.me

echo "==> shipping binary to ${HOST}"
scp /tmp/${PROJECT}-server "${HOST}:/tmp/${PROJECT}-server"

echo "==> moulinsart deploy ${PROJECT}"
ssh "${HOST}" "moulinsart deploy ${PROJECT} /tmp/${PROJECT}-server"

echo "==> rsyncing ./public/ to ${VM}:/opt/app/public/"
rsync -azP --delete ./public/ "${VM}:/opt/app/public/"

echo "==> done. https://${VM}/"
