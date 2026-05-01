#!/usr/bin/env bash
# Build + publish baldassari.xyz to moulinsart `blog`.
set -euo pipefail
cd "$(dirname "$0")"
./deploy/build.sh
./deploy/publish.sh
