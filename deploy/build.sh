#!/usr/bin/env bash
# Build the Zola site (./public/) and ensure the Caddy binary
# (linux/amd64) is cached locally for shipping.
set -euo pipefail

cd "$(dirname "$0")/.."

echo "==> zola build"
zola build

CADDY_VERSION=2.8.4
CADDY_BIN=/tmp/caddy-${CADDY_VERSION}-linux-amd64

if [ ! -x "$CADDY_BIN" ]; then
	echo "==> downloading caddy v${CADDY_VERSION} (linux/amd64)"
	tmpdir=$(mktemp -d)
	curl -fsSL "https://github.com/caddyserver/caddy/releases/download/v${CADDY_VERSION}/caddy_${CADDY_VERSION}_linux_amd64.tar.gz" \
		| tar -xzC "$tmpdir" caddy
	mv "$tmpdir/caddy" "$CADDY_BIN"
	chmod +x "$CADDY_BIN"
	rm -rf "$tmpdir"
fi
