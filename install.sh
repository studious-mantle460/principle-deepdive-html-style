#!/usr/bin/env bash
# Principle Deepdive HTML Style · one-line installer
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/Misakakuroko/principle-deepdive-html-style/main/install.sh | bash
# Override install location:
#   INSTALL_DIR=~/my-skills/foo bash <(curl -fsSL https://raw.githubusercontent.com/Misakakuroko/principle-deepdive-html-style/main/install.sh)

set -e

REPO_URL="https://github.com/Misakakuroko/principle-deepdive-html-style.git"
SKILL_NAME="principle-deepdive-html-style"

# Colors (if terminal supports it)
if [ -t 1 ] && [ -z "${NO_COLOR:-}" ]; then
  CYAN='\033[0;36m'
  GREEN='\033[0;32m'
  YELLOW='\033[1;33m'
  RED='\033[0;31m'
  BOLD='\033[1m'
  RESET='\033[0m'
else
  CYAN=''; GREEN=''; YELLOW=''; RED=''; BOLD=''; RESET=''
fi

say() { printf "${CYAN}[install]${RESET} %s\n" "$*"; }
ok()  { printf "${GREEN}[ok]${RESET} %s\n" "$*"; }
warn(){ printf "${YELLOW}[warn]${RESET} %s\n" "$*"; }
die() { printf "${RED}[error]${RESET} %s\n" "$*" >&2; exit 1; }

# Check dependencies
command -v git >/dev/null 2>&1 || die "git is required but not installed."

# Determine install location(s)
declare -a TARGETS=()

if [ -n "${INSTALL_DIR:-}" ]; then
  TARGETS+=("$INSTALL_DIR")
else
  # Auto-detect Claude Code and/or Cursor
  if [ -d "$HOME/.claude" ]; then
    TARGETS+=("$HOME/.claude/skills/$SKILL_NAME")
  fi
  if [ -d "$HOME/.cursor" ]; then
    TARGETS+=("$HOME/.cursor/skills/$SKILL_NAME")
  fi

  # If neither exists, default to ~/.claude/skills/ (creates the dir)
  if [ ${#TARGETS[@]} -eq 0 ]; then
    warn "Neither ~/.claude nor ~/.cursor found · defaulting to ~/.claude/skills/"
    TARGETS+=("$HOME/.claude/skills/$SKILL_NAME")
  fi
fi

# Install to each target
for TARGET in "${TARGETS[@]}"; do
  PARENT_DIR="$(dirname "$TARGET")"
  mkdir -p "$PARENT_DIR"

  if [ -d "$TARGET/.git" ]; then
    say "Updating existing install at $TARGET"
    (cd "$TARGET" && git pull --ff-only) || die "git pull failed at $TARGET"
  elif [ -d "$TARGET" ]; then
    die "$TARGET already exists but is not a git repo · please remove it manually first."
  else
    say "Cloning to $TARGET"
    git clone --depth=1 "$REPO_URL" "$TARGET" || die "git clone failed"
  fi

  ok "Installed at: $TARGET"
done

# Summary
echo ""
ok "${BOLD}principle-deepdive-html-style is ready.${RESET}"
echo ""
echo "Try asking your agent:"
echo "  ${BOLD}\"Generate a deep-dive HTML article on [topic] in the principle-deepdive style\"${RESET}"
echo ""
echo "Or load the skill explicitly:"
echo "  ${BOLD}\"Use the principle-deepdive-html-style skill to ...\"${RESET}"
echo ""
