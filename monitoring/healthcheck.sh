#!/usr/bin/env bash
set -euo pipefail
echo "===== HOST ====="
hostnamectl
echo
echo "===== DISK ====="
df -h
echo
echo "===== MEMORY ====="
free -h
echo
echo "===== PM2 ====="
pm2 list
echo
echo "===== NODE ====="
node -v
npm -v
