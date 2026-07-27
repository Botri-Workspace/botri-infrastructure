#!/usr/bin/env bash
set -euo pipefail
git pull --rebase
npm install
pm2 reload all || pm2 start ecosystem.config.js
pm2 save
