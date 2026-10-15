#!/usr/bin/env bash
# Installer for antigravity-switcher & auto-rotation
# Author: @0xposa (Twitter / X)
set -e

echo -e "\033[1;34m========================================================\033[0m"
echo -e "\033[1;32m          Installing Antigravity Switcher               \033[0m"
echo -e "       Author: \033[1;36m@0xposa\033[0m (https://x.com/0xposa)        "
echo -e "\033[1;34m========================================================\033[0m"

# Tentukan direktori instalasi binary
if [ -n "$PREFIX" ] && [ -d "$PREFIX/bin" ]; then
  BIN_DIR="$PREFIX/bin"
elif [ -d "$HOME/.local/bin" ]; then
  BIN_DIR="$HOME/.local/bin"
elif [ -w "/usr/local/bin" ]; then
  BIN_DIR="/usr/local/bin"
else
  BIN_DIR="$HOME/.gemini/antigravity-cli/bin"
  mkdir -p "$BIN_DIR"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"
CLEANUP_TEMP=0

if [ -z "$SCRIPT_DIR" ] || [ ! -f "$SCRIPT_DIR/bin/agy-switcher" ]; then
  TEMP_DIR="$(mktemp -d)"
  CLEANUP_TEMP=1
  echo "📥 Mengunduh repository antigravity-switcher..."
  git clone --depth=1 https://github.com/0xposa/antigravity-switcher.git "$TEMP_DIR"
  SCRIPT_DIR="$TEMP_DIR"
fi

echo "📁 Installing binaries to: $BIN_DIR"
cp "$SCRIPT_DIR/bin/agy-switcher" "$BIN_DIR/agy-switcher"
ln -sf "$BIN_DIR/agy-switcher" "$BIN_DIR/agy-rotation"
if [ -f "$SCRIPT_DIR/bin/agy-claude" ]; then
  cp "$SCRIPT_DIR/bin/agy-claude" "$BIN_DIR/agy-claude"
  chmod +x "$BIN_DIR/agy-claude"
fi

chmod +x "$BIN_DIR/agy-switcher"

# Fix shebangs untuk Termux jika tersedia
if command -v termux-fix-shebang >/dev/null 2>&1; then
  echo "🔧 Fixing shebangs for Termux environment..."
  termux-fix-shebang "$BIN_DIR/agy-switcher" 2>/dev/null || true
fi

# Pasang Custom Skills ke Antigravity
SKILLS_DIR_GLOBAL="$HOME/.gemini/config/skills"
SKILLS_DIR_LOCAL="$HOME/.agents/skills"
SKILLS_DIR_CLI="$HOME/.gemini/antigravity-cli/skills"

for skill_name in antigravity-switcher account-switcher switch-account; do
  if [ -d "$SCRIPT_DIR/skills/$skill_name" ]; then
    mkdir -p "$SKILLS_DIR_GLOBAL/$skill_name" "$SKILLS_DIR_LOCAL/$skill_name" "$SKILLS_DIR_CLI/$skill_name"
    cp -r "$SCRIPT_DIR/skills/$skill_name/"* "$SKILLS_DIR_GLOBAL/$skill_name/"
    cp -r "$SCRIPT_DIR/skills/$skill_name/"* "$SKILLS_DIR_LOCAL/$skill_name/"
    cp -r "$SCRIPT_DIR/skills/$skill_name/"* "$SKILLS_DIR_CLI/$skill_name/"
  fi
done

# Pasang Workspace Rules (AGENTS.md & GEMINI.md)
if [ -f "$SCRIPT_DIR/AGENTS.md" ]; then
  cp "$SCRIPT_DIR/AGENTS.md" "$HOME/AGENTS.md"
  cp "$SCRIPT_DIR/AGENTS.md" "$HOME/GEMINI.md"
  mkdir -p "$HOME/.gemini/antigravity-cli"
  cp "$SCRIPT_DIR/AGENTS.md" "$HOME/.gemini/antigravity-cli/GEMINI.md"
fi

if [ "$CLEANUP_TEMP" -eq 1 ] && [ -n "$TEMP_DIR" ] && [ -d "$TEMP_DIR" ]; then
  rm -rf "$TEMP_DIR"
fi

echo -e "\n\033[1;32m✅ Instalasi Berhasil!\033[0m"
echo -e "Di Termux: jalankan \033[1;33magy-switcher\033[0m untuk menu interaktif (Add/Remove/List Account)."
echo -e "Di Antigravity: gunakan \033[1;33m/account-switcher\033[0m atau \033[1;33m/antigravity-switcher\033[0m."
echo -e "Follow creator on X: \033[1;36mhttps://x.com/0xposa\033[0m\n"
