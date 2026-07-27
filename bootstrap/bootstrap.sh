#!/usr/bin/env bash
set -euo pipefail
sudo apt update
sudo apt install -y curl git build-essential unzip zip jq nginx
if ! command -v node >/dev/null; then curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash - && sudo apt install -y nodejs; fi
sudo npm install -g pm2
npx playwright install --with-deps || true
