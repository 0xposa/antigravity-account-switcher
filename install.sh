#!/usr/bin/env bash
# Installer for antigravity-account-switcher & auto-rotation
# Author: @0xposa (Twitter / X)
set -e

echo -e "\033[1;34m========================================================\033[0m"
echo -e "\033[1;32m       Installing Antigravity Account Switcher          \033[0m"
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

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "📁 Installing binaries to: $BIN_DIR"
cp "$SCRIPT_DIR/bin/agy-rotation" "$BIN_DIR/agy-rotation"
ln -sf "$BIN_DIR/agy-rotation" "$BIN_DIR/agy-account"
if [ -f "$SCRIPT_DIR/bin/agy-claude" ]; then
  cp "$SCRIPT_DIR/bin/agy-claude" "$BIN_DIR/agy-claude"
  chmod +x "$BIN_DIR/agy-claude"
fi

chmod +x "$BIN_DIR/agy-rotation"

# Fix shebangs untuk Termux jika tersedia
if command -v termux-fix-shebang >/dev/null 2>&1; then
  echo "🔧 Fixing shebangs for Termux environment..."
  termux-fix-shebang "$BIN_DIR/agy-rotation" 2>/dev/null || true
fi

# Pasang Custom Skills ke Antigravity
SKILLS_DIR_GLOBAL="$HOME/.gemini/config/skills"
SKILLS_DIR_LOCAL="$HOME/.agents/skills"
mkdir -p "$SKILLS_DIR_GLOBAL/switch-account" "$SKILLS_DIR_GLOBAL/model-rotation"
mkdir -p "$SKILLS_DIR_LOCAL/switch-account" "$SKILLS_DIR_LOCAL/model-rotation"

cp "$SCRIPT_DIR/skills/switch-account/SKILL.md" "$SKILLS_DIR_GLOBAL/switch-account/SKILL.md"
cp "$SCRIPT_DIR/skills/switch-account/SKILL.md" "$SKILLS_DIR_LOCAL/switch-account/SKILL.md"
cp "$SCRIPT_DIR/skills/model-rotation/SKILL.md" "$SKILLS_DIR_GLOBAL/model-rotation/SKILL.md"
cp "$SCRIPT_DIR/skills/model-rotation/SKILL.md" "$SKILLS_DIR_LOCAL/model-rotation/SKILL.md"

# Pasang Workspace Rules (AGENTS.md & GEMINI.md)
if [ -f "$SCRIPT_DIR/AGENTS.md" ]; then
  cp "$SCRIPT_DIR/AGENTS.md" "$HOME/AGENTS.md"
  cp "$SCRIPT_DIR/AGENTS.md" "$HOME/GEMINI.md"
  mkdir -p "$HOME/.gemini/antigravity-cli"
  cp "$SCRIPT_DIR/AGENTS.md" "$HOME/.gemini/antigravity-cli/GEMINI.md"
fi

echo -e "\n\033[1;32m✅ Instalasi Berhasil!\033[0m"
echo -e "Di Termux: jalankan \033[1;33magy-rotation\033[0m untuk menu interaktif (Add/Remove/List Account)."
echo -e "Di Antigravity: gunakan \033[1;33m/model-rotation\033[0m atau \033[1;33m/switch-account\033[0m."
echo -e "Follow creator on X: \033[1;36mhttps://x.com/0xposa\033[0m\n"
