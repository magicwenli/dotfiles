#!/bin/bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

# build ubuntu.Dockerfile
docker build -t ubuntu_latest -f ubuntu.Dockerfile .
# test chezmoi
docker run --rm -it \
    -e http_proxy=http://172.16.21.55:7890 \
    -e https_proxy=http://172.16.21.55:7890 \
    ubuntu_latest \
    sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --branch dev magicwenli && \
    ~/.local/bin/chezmoi apply && \
    bash