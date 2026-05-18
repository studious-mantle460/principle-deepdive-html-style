# Principle Deepdive HTML Style · one-line installer (Windows PowerShell)
# Usage:
#   irm https://raw.githubusercontent.com/Misakakuroko/principle-deepdive-html-style/main/install.ps1 | iex
# Override install location:
#   $env:INSTALL_DIR = "$HOME\my-skills\foo"; irm https://raw.githubusercontent.com/Misakakuroko/principle-deepdive-html-style/main/install.ps1 | iex

$ErrorActionPreference = "Stop"

$RepoUrl   = "https://github.com/Misakakuroko/principle-deepdive-html-style.git"
$SkillName = "principle-deepdive-html-style"

function Say   ($msg) { Write-Host "[install] $msg" -ForegroundColor Cyan }
function Ok    ($msg) { Write-Host "[ok] $msg" -ForegroundColor Green }
function Warn  ($msg) { Write-Host "[warn] $msg" -ForegroundColor Yellow }
function Die   ($msg) { Write-Host "[error] $msg" -ForegroundColor Red; exit 1 }

# Check dependencies
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  Die "git is required but not installed. Install from https://git-scm.com/download/win"
}

# Determine install location(s)
$Targets = @()

if ($env:INSTALL_DIR) {
  $Targets += $env:INSTALL_DIR
} else {
  # Auto-detect Claude Code and/or Cursor
  $ClaudeDir = Join-Path $HOME ".claude"
  $CursorDir = Join-Path $HOME ".cursor"

  if (Test-Path $ClaudeDir) {
    $Targets += (Join-Path $ClaudeDir "skills\$SkillName")
  }
  if (Test-Path $CursorDir) {
    $Targets += (Join-Path $CursorDir "skills\$SkillName")
  }

  # If neither exists, default to ~/.claude/skills/
  if ($Targets.Count -eq 0) {
    Warn "Neither ~/.claude nor ~/.cursor found · defaulting to ~/.claude/skills/"
    $Targets += (Join-Path $ClaudeDir "skills\$SkillName")
  }
}

# Install to each target
foreach ($Target in $Targets) {
  $ParentDir = Split-Path -Parent $Target
  if (-not (Test-Path $ParentDir)) {
    New-Item -ItemType Directory -Path $ParentDir -Force | Out-Null
  }

  $GitDir = Join-Path $Target ".git"
  if (Test-Path $GitDir) {
    Say "Updating existing install at $Target"
    Push-Location $Target
    try {
      git pull --ff-only
      if ($LASTEXITCODE -ne 0) { Die "git pull failed at $Target" }
    } finally {
      Pop-Location
    }
  } elseif (Test-Path $Target) {
    Die "$Target already exists but is not a git repo · please remove it manually first."
  } else {
    Say "Cloning to $Target"
    git clone --depth=1 $RepoUrl $Target
    if ($LASTEXITCODE -ne 0) { Die "git clone failed" }
  }

  Ok "Installed at: $Target"
}

# Summary
Write-Host ""
Ok "principle-deepdive-html-style is ready."
Write-Host ""
Write-Host "Try asking your agent:" -ForegroundColor White
Write-Host "  `"Generate a deep-dive HTML article on [topic] in the principle-deepdive style`"" -ForegroundColor White
Write-Host ""
Write-Host "Or load the skill explicitly:" -ForegroundColor White
Write-Host "  `"Use the principle-deepdive-html-style skill to ...`"" -ForegroundColor White
Write-Host ""
