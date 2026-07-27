#!/usr/bin/env bash
set -euo pipefail
STAMP=$(date +%Y%m%d-%H%M%S)
DEST=${1:-$HOME/backups}
mkdir -p "$DEST"
tar --exclude=node_modules --exclude=.git --exclude=.pm2/logs -czf "$DEST/botri-workspace-$STAMP.tar.gz" -C "$HOME" Botri-Workspace
