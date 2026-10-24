#!/bin/bash
set -euo pipefail

# Only run in Claude Code cloud sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Install the graphify CLI (used by the graphify skill and the PreToolUse hooks)
if ! command -v graphify >/dev/null 2>&1 && [ ! -x "$HOME/.local/bin/graphify" ]; then
  uv tool install graphifyy -q
fi

# Install the agent-browser CLI and its Chrome (used by the agent-browser skill)
if ! command -v agent-browser >/dev/null 2>&1; then
  npm install -g agent-browser --silent
fi
if [ ! -d "$HOME/.agent-browser/browsers" ] || [ -z "$(ls -A "$HOME/.agent-browser/browsers")" ]; then
  agent-browser install
fi

if [ -n "${CLAUDE_ENV_FILE:-}" ]; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$CLAUDE_ENV_FILE"
fi
