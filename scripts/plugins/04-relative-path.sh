#!/usr/bin/env bash
set -e
ROOT_DIR="${1:-.}"
echo "[04] 修复相对路径 ./"
grep -rl '"\./' "$ROOT_DIR" --include="*.html" 2>/dev/null | while read -r file; do
  sed -i 's#\./#/#g' "$file"
done
