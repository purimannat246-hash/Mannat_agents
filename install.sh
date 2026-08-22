#!/usr/bin/env bash
# Installs the 10 virtual-startup-team agents into ~/.claude/agents/ so they
# apply automatically in every project you open with Claude Code on this
# machine (not just this repo).
#
# Usage:
#   ./install.sh
#
# Re-run any time after editing an agent in .claude/agents/ to sync your
# global copy.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$SCRIPT_DIR/.claude/agents"
DEST_DIR="$HOME/.claude/agents"

if [ ! -d "$SRC_DIR" ]; then
  echo "Error: $SRC_DIR not found. Run this from the Mannat_agents repo root." >&2
  exit 1
fi

mkdir -p "$DEST_DIR"
cp -v "$SRC_DIR"/*.md "$DEST_DIR"/

echo ""
echo "Installed $(ls "$SRC_DIR"/*.md | wc -l | tr -d ' ') agents to $DEST_DIR"
echo "They now apply automatically in every project on this machine."
echo ""
echo "Don't forget gstack (one-time, separate step):"
echo "  git clone --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack"
echo "  cd ~/.claude/skills/gstack && ./setup --team"
