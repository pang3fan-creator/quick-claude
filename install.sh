#!/bin/zsh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
APP_NAME="Open Claude Here"
APP_SOURCE="$SCRIPT_DIR/macos/$APP_NAME.app"
APP_DEST="$HOME/Applications/$APP_NAME.app"

# ===== 1. Build .app from source =====
echo "Building $APP_NAME..."
cd "$SCRIPT_DIR"
./macos/build-app.sh
echo ""

# ===== 2. Copy to ~/Applications =====
mkdir -p "$HOME/Applications"
rm -rf "$APP_DEST"
cp -R "$APP_SOURCE" "$APP_DEST"
echo "Installed to $APP_DEST"

echo ""

# ===== 3. Done =====
cat << EOF
=== Installation Complete ===

You can now use "$APP_NAME" in two ways:

1. 📌 Finder Toolbar (recommended):
   -> Open a Finder window
   -> Hold Cmd key and drag "$APP_NAME" from ~/Applications
      to the Finder toolbar area
   -> Click the icon to open claude in the current folder

2. 📱 Dock:
   -> Drag "$APP_NAME" from ~/Applications to the Dock
   -> Click anytime to open claude in the frontmost Finder window

3. ⌨️ Keyboard Shortcut (optional):
   System Settings -> Keyboard -> Keyboard Shortcuts ->
   App Shortcuts -> + -> Add "Open Claude Here"
   (Choose any shortcut you like)

Tip: You can put it in BOTH toolbar and Dock!

To uninstall:
  ./uninstall.sh

EOF
