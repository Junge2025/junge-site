#!/usr/bin/env bash
set -e
ROOT_DIR="${1:-.}"
echo "[02] 去除 /index.html"
grep -rl '/index.html' "$ROOT_DIR" --include="*.html" 2>/dev/null | while read -r file; do
  sed -i 's#/index.html#/#g' "$file"
done
