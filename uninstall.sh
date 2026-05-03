#!/bin/zsh

set -euo pipefail

APP_DEST="$HOME/Applications/Open Claude Here.app"
WORKFLOW_DEST="$HOME/Library/Services/Open Claude Here.workflow"

REMOVED=false

# ===== 1. Remove .app from ~/Applications =====
if [[ -d "$APP_DEST" ]]; then
	rm -rf "$APP_DEST"
	echo "Removed: $APP_DEST"
	REMOVED=true
fi

# ===== 2. Remove old workflow (if upgrading from previous version) =====
if [[ -d "$WORKFLOW_DEST" ]]; then
	rm -rf "$WORKFLOW_DEST"
	echo "Removed old workflow: $WORKFLOW_DEST"
	/System/Library/CoreServices/pbs -flush &>/dev/null || true
	REMOVED=true
fi

if [[ "$REMOVED" == false ]]; then
	echo "Open Claude Here is not installed. Nothing to remove."
	exit 0
fi

echo ""
echo "=== Uninstall Complete ==="
echo ""
echo "If you had added the app to the Finder toolbar or Dock,"
echo "please remove it manually by dragging it out."
