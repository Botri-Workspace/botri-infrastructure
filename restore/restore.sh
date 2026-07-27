#!/usr/bin/env bash
set -euo pipefail
[ $# -eq 1 ] || { echo "Usage: restore.sh <backup.tar.gz>"; exit 1; }
tar -xzf "$1" -C "$HOME"
