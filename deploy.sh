#!/usr/bin/env bash
# Deploy baldassari.xyz to the moulinsart `blog` project on prod.
# Builds the Zola site, ships a tiny static-file binary, syncs ./public/.
set -euo pipefail

cd "$(dirname "$0")"

PROJECT=blog
HOST=moulinsart-prod
VM=blog.baldassari.me

echo "==> zola build"
zola build

echo "==> cross-compiling static-file server (linux/amd64)"
GOOS=linux GOARCH=amd64 go build -o /tmp/${PROJECT}-server ./deploy/server.go

echo "==> shipping binary to ${HOST}"
scp /tmp/${PROJECT}-server "${HOST}:/tmp/${PROJECT}-server"

echo "==> moulinsart deploy ${PROJECT}"
ssh "${HOST}" "moulinsart deploy ${PROJECT} /tmp/${PROJECT}-server"

echo "==> rsyncing ./public/ to ${VM}:/opt/app/public/"
rsync -azP --delete ./public/ "${VM}:/opt/app/public/"

echo "==> done. https://${VM}/"
