#!/bin/zsh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_APPLESCRIPT="$SCRIPT_DIR/open-claude-here.applescript"
OUTPUT_APP="$SCRIPT_DIR/Open Claude Here.app"

# ===== 1. Detect claude path =====
CLAUDE_PATH=""
if command -v claude &>/dev/null; then
	CLAUDE_PATH=$(command -v claude)
else
	for p in "$HOME/.local/bin/claude" "/opt/homebrew/bin/claude" "/usr/local/bin/claude"; do
		if [[ -x "$p" ]]; then
			CLAUDE_PATH="$p"
			break
		fi
	done
fi

if [[ -z "$CLAUDE_PATH" ]]; then
	echo "Error: claude command not found."
	echo "Please install Claude Code CLI first: https://docs.anthropic.com/en/docs/claude-code"
	exit 1
fi

echo "Found claude at: $CLAUDE_PATH"

# ===== 2. Compile .app =====
sed "s|__CLAUDE_PATH__|$CLAUDE_PATH|g" "$SOURCE_APPLESCRIPT" | \
	osacompile -o "$OUTPUT_APP" -x -

echo "Built: $OUTPUT_APP"
