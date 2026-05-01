#!/usr/bin/env bash
# Build the Zola site (./public/) and the static-file server binary
# (/tmp/blog-server, linux/amd64 for the moulinsart prod VM).
set -euo pipefail

cd "$(dirname "$0")/.."

echo "==> zola build"
zola build

echo "==> cross-compiling static-file server (linux/amd64)"
GOOS=linux GOARCH=amd64 go build -o /tmp/blog-server ./deploy/server.go
