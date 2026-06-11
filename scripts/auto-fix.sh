#!/usr/bin/env bash
set -e

ROOT_DIR="${1:-.}"
PLUGIN_DIR="${2:-scripts/plugins}"

echo "=== Auto-Fix Super (Plugin System) ==="
echo "ROOT_DIR: $ROOT_DIR"
echo "PLUGIN_DIR: $PLUGIN_DIR"

if [ ! -d "$PLUGIN_DIR" ]; then
  echo "⚠️  Plugin directory not found: $PLUGIN_DIR"
  exit 0
fi

for plugin in "$PLUGIN_DIR"/*.sh; do
  [ -e "$plugin" ] || continue
  echo "→ Running plugin: $(basename "$plugin")"
  bash "$plugin" "$ROOT_DIR"
done

echo "=== All plugins executed ==="
