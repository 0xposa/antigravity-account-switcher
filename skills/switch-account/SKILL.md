---
name: switch-account
description: Manages multiple Google Antigravity accounts, checks current account, and rotates accounts when rate limit or quota is exhausted.
---

# Antigravity Account Switcher Skill

Use this skill when the user asks to check the active account, switch accounts, add a new account, or rotate accounts after hitting Claude or Gemini model limits.

## Available CLI Commands

The system is equipped with the `agy-account` utility:

1. **Check current active account & list all accounts:**
   ```bash
   agy-account list
   ```

2. **Rotate to the next account in the pool:**
   ```bash
   agy-account rotate
   ```

3. **Switch to a specific account by email or number:**
   ```bash
   agy-account switch <nomor/email>
   ```

4. **Add a new Google account:**
   ```bash
   agy-account add
   ```

## When Claude Opus/Sonnet Hits Rate Limit:
1. Run `agy-account rotate` to switch the underlying OAuth credential to the next Google account.
2. The user can then resume their task seamlessly using `agy --continue`.
