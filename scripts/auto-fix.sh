#!/usr/bin/env bash
set -e

echo "=== Auto-Fix Super: URL / Path / Domain 修复开始 ==="

# -----------------------------
# ① http → https
# -----------------------------
echo "[1/6] 修复 http → https"
grep -rl 'http://' . --include="*.html" 2>/dev/null | while read -r file; do
  sed -i 's#http://#https://#g' "$file"
done

# -----------------------------
# ② 去除 /index.html
# -----------------------------
echo "[2/6] 去除 /index.html"
grep -rl '/index.html' . --include="*.html" 2>/dev/null | while read -r file; do
  sed -i 's#/index.html#/#g' "$file"
done

# -----------------------------
# ③ 修复重复斜杠 (https://// → https://)
# -----------------------------
echo "[3/6] 修复重复斜杠 https://// → https://"
grep -rl ':////' . --include="*.html" 2>/dev/null | while read -r file; do
  sed -i 's#:////#://#g' "$file"
done

# -----------------------------
# ④ 相对路径修复 ./ → /
# -----------------------------
echo "[4/6] 修复相对路径 ./ → /"
grep -rl '"\./' . --include="*.html" 2>/dev/null | while read -r file; do
  sed -i 's#\./#/#g' "$file"
done

# -----------------------------
# ⑤ CDN 域名替换（按需修改下方域名后取消注释）
# -----------------------------
# OLD_CDN="cdn.old.com"
# NEW_CDN="cdn.new.com"
# echo "[5/6] CDN 域名替换（$OLD_CDN → $NEW_CDN）"
# grep -rl "$OLD_CDN" . --include="*.html" 2>/dev/null | while read -r file; do
#   sed -i "s#$OLD_CDN#$NEW_CDN#g" "$file"
# done

# -----------------------------
# ⑥ 旧域名替换（按需修改下方域名后取消注释）
# -----------------------------
# OLD_DOMAIN="oldsite.com"
# NEW_DOMAIN="junge.中国"
# echo "[6/6] 旧域名替换（$OLD_DOMAIN → $NEW_DOMAIN）"
# grep -rl "$OLD_DOMAIN" . --include="*.html" 2>/dev/null | while read -r file; do
#   sed -i "s#$OLD_DOMAIN#$NEW_DOMAIN#g" "$file"
# done

echo "=== Auto-Fix Super 完成 ==="
