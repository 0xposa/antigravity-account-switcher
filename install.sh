#!/usr/bin/env bash
# Installer for antigravity-account-switcher
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
cp "$SCRIPT_DIR/bin/agy-account" "$BIN_DIR/agy-account"
cp "$SCRIPT_DIR/bin/agy-claude" "$BIN_DIR/agy-claude"
ln -sf "$BIN_DIR/agy-claude" "$BIN_DIR/agy-auto"

chmod +x "$BIN_DIR/agy-account" "$BIN_DIR/agy-claude"

# Fix shebangs untuk Termux jika tersedia
if command -v termux-fix-shebang >/dev/null 2>&1; then
  echo "🔧 Fixing shebangs for Termux environment..."
  termux-fix-shebang "$BIN_DIR/agy-account" "$BIN_DIR/agy-claude" 2>/dev/null || true
fi

# Pasang Custom Skill ke Antigravity
SKILL_DIR="$HOME/.gemini/config/skills/switch-account"
mkdir -p "$SKILL_DIR"
if [ -f "$SCRIPT_DIR/skills/switch-account/SKILL.md" ]; then
  cp "$SCRIPT_DIR/skills/switch-account/SKILL.md" "$SKILL_DIR/SKILL.md"
  echo "✨ Installed Antigravity skill to: $SKILL_DIR/SKILL.md"
fi

# Simpan token aktif sekarang jika belum tersimpan
if [ -f "$HOME/.gemini/antigravity-cli/antigravity-oauth-token" ]; then
  echo "💾 Backing up current active token to accounts pool..."
  "$BIN_DIR/agy-account" save >/dev/null 2>&1 || true
fi

echo -e "\n\033[1;32m✅ Instalasi Berhasil!\033[0m"
echo -e "Jalankan \033[1;33magy-account\033[0m untuk mengelola akun."
echo -e "Jalankan \033[1;33magy-claude\033[0m untuk menjalankan Claude dengan auto-switch limit."
echo -e "Follow creator on X: \033[1;36mhttps://x.com/0xposa\033[0m\n"
