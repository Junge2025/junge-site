#!/usr/bin/env bash
set -e
ROOT_DIR="${1:-.}"
echo "[01] http → https"
grep -rl 'http://' "$ROOT_DIR" --include="*.html" 2>/dev/null | while read -r file; do
  sed -i 's#http://#https://#g' "$file"
done
