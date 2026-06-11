#!/bin/bash
# auto-fix.sh — URL/路径/域名级修复规则
set -e

echo "🔧 Running URL/path/domain auto-fix rules..."

# http → https
find . -name "*.html" -type f -exec sed -i 's/http:\/\//https:\/\//g' {} \;
echo "  ✓ http → https"

# /index.html → /
find . -name "*.html" -type f -exec sed -i 's/\/index\.html"/"/g' {} \;
echo "  ✓ /index.html → /"

# 修复重复斜杠 // → /
find . -name "*.html" -type f -exec sed -i 's/https:\/\/\//https:\/\//g' {} \;
echo "  ✓ 重复斜杠修复"

# 修复 ./path → /path
find . -name "*.html" -type f -exec sed -i 's/\.\/\([a-zA-Z0-9]\)/\1/g' {} \;
echo "  ✓ ./path → /path"

# 旧 CDN 链接（按需取消注释）
# find . -name "*.html" -type f -exec sed -i 's/cdn.old.com/cdn.new.com/g' {} \;

# 旧域名迁移（按需取消注释）
# find . -name "*.html" -type f -exec sed -i 's/old-domain.com/junge.中国/g' {} \;

echo "✅ auto-fix.sh complete"
