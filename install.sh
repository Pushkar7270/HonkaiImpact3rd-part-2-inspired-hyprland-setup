#!/usr/bin/env bash
#
# Honkai Impact 3rd Part 2 — inspired Hyprland setup
# Installs the configs from this repo on top of an existing illogical-impulse
# installation. It never runs sudo and never deletes your files: anything it
# replaces is moved to ~/.config-backup-<timestamp>/.
#
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"
ASSUME_YES=0
SKIP_SHELL=0

usage() {
    cat <<EOF
Usage: ./install.sh [options]

  --yes          do not ask for confirmation
  --no-shell     do not clone/patch the end4-pC shell
  -h, --help     show this help

Before running this, install the base:
  git clone https://github.com/end-4/dots-hyprland
  cd dots-hyprland && ./setup install
EOF
}

for arg in "$@"; do
    case "$arg" in
        --yes|-y)   ASSUME_YES=1 ;;
        --no-shell) SKIP_SHELL=1 ;;
        -h|--help)  usage; exit 0 ;;
        *) echo "Unknown option: $arg"; usage; exit 1 ;;
    esac
done

if [[ $EUID -eq 0 ]]; then
    echo "Do not run this as root. Run it as your normal user." >&2
    exit 1
fi

confirm() {
    [[ $ASSUME_YES -eq 1 ]] && return 0
    read -rp "$1 [y/N] " answer
    [[ "$answer" =~ ^[Yy]$ ]]
}

backup_path() {
    local path="$1"
    [[ -e "$path" ]] || return 0
    mkdir -p "$BACKUP_DIR/$(dirname "${path#"$HOME"/}")"
    mv "$path" "$BACKUP_DIR/${path#"$HOME"/}"
    echo "  backed up: $path"
}

rewrite_home() {
    local file="$1"
    [[ -f "$file" ]] || return 0
    sed -i "s|/home/dreamseeker|$HOME|g" "$file"
}

echo "==> Installing from: $REPO_DIR"
echo "==> Backups go to:   $BACKUP_DIR"
echo
confirm "Copy the Hyprland + shell configs and wallpapers into your home?" || { echo "Aborted."; exit 0; }

# --- 1. configs -------------------------------------------------------------
echo "==> Hyprland config"
backup_path "$HOME/.config/hypr"
cp -a "$REPO_DIR/config/hypr" "$HOME/.config/hypr"
while IFS= read -r -d '' f; do rewrite_home "$f"; done < <(find "$HOME/.config/hypr" -type f -print0)

echo "==> Shell config (illogical-impulse/config.json)"
mkdir -p "$HOME/.config/illogical-impulse"
if [[ -f "$HOME/.config/illogical-impulse/config.json" ]]; then
    cp "$HOME/.config/illogical-impulse/config.json" "$BACKUP_DIR/config.json.old" 2>/dev/null || true
fi
cp "$REPO_DIR/config/illogical-impulse/config.json" "$HOME/.config/illogical-impulse/config.json"
rewrite_home "$HOME/.config/illogical-impulse/config.json"

echo "==> fish PATH snippet"
mkdir -p "$HOME/.config/fish/conf.d"
cp "$REPO_DIR/config/fish/conf.d/00-user-path.fish" "$HOME/.config/fish/conf.d/"

# Use this shell instead of the default "ii"
mkdir -p "$HOME/.config/hypr/custom"
if ! grep -q 'qsConfig.*end4-pC' "$HOME/.config/hypr/custom/variables.lua" 2>/dev/null; then
    printf '\n-- Use the end4-pC shell instead of the default "ii" shell\nhl.env("qsConfig", "end4-pC")\n' \
        >> "$HOME/.config/hypr/custom/variables.lua"
fi

# --- 2. helper scripts ------------------------------------------------------
echo "==> Helper scripts (~/bin)"
mkdir -p "$HOME/bin"
cp "$REPO_DIR"/local/bin/* "$HOME/bin/"
chmod +x "$HOME/bin/"*

echo "==> systemd user units (live wallpaper watchdog)"
mkdir -p "$HOME/.config/systemd/user"
cp "$REPO_DIR"/config/systemd/user/* "$HOME/.config/systemd/user/"
if systemctl --user daemon-reload >/dev/null 2>&1; then
    systemctl --user enable --now live-wallpaper-watchdog.timer >/dev/null 2>&1 || true
    echo "  live-wallpaper-watchdog.timer enabled (checks every 30 s)"
else
    echo "  systemctl --user is not available in this session."
    echo "  After logging in, run: systemctl --user enable --now live-wallpaper-watchdog.timer"
fi

# --- 3. wallpapers + avatar -------------------------------------------------
echo "==> Wallpapers (~/Pictures/Wallpapers)"
mkdir -p "$HOME/Pictures/Wallpapers"
cp -n "$REPO_DIR"/wallpapers/* "$HOME/Pictures/Wallpapers/" 2>/dev/null || true
ln -sfn "$HOME/Pictures/Wallpapers" "$HOME/Wallpapers"

echo "==> Avatar"
mkdir -p "$HOME/.config/quickshell/avatar"
cp "$REPO_DIR/avatar/avatar.png" "$HOME/.config/quickshell/avatar/avatar.png"
cp "$REPO_DIR/avatar/face.jpg" "$HOME/.face"
cp "$REPO_DIR/avatar/face.jpg" "$HOME/.face.icon" 2>/dev/null || true

# --- 4. shell fork ----------------------------------------------------------
if [[ $SKIP_SHELL -eq 0 ]]; then
    SHELL_DIR="$HOME/.config/quickshell/end4-pC"
    if [[ ! -d "$SHELL_DIR" ]]; then
        echo "==> Cloning end4-pC shell"
        mkdir -p "$HOME/.config/quickshell"
        git clone https://github.com/pctrade/end4-pC.git "$SHELL_DIR"
    else
        echo "==> end4-pC already exists, leaving it untouched"
    fi
    if [[ -d "$SHELL_DIR/.git" ]]; then
        echo "==> Applying local patch"
        git -C "$SHELL_DIR" fetch --quiet --depth=1 origin 6b4485b 2>/dev/null || true
        git -C "$SHELL_DIR" checkout -q 6b4485b 2>/dev/null || true
        if git -C "$SHELL_DIR" apply --check "$REPO_DIR/docs/end4-pC-local.patch" 2>/dev/null; then
            git -C "$SHELL_DIR" apply "$REPO_DIR/docs/end4-pC-local.patch"
            echo "  patch applied"
        else
            echo "  patch does not apply cleanly (already applied, or the fork changed)."
            echo "  Fix it manually: git -C $SHELL_DIR apply $REPO_DIR/docs/end4-pC-local.patch"
        fi
    fi
fi

# --- 5. restart -------------------------------------------------------------
echo "==> Reloading"
if command -v hyprctl >/dev/null && [[ -n "${HYPRLAND_INSTANCE_SIGNATURE:-}" ]]; then
    hyprctl reload >/dev/null 2>&1 || true
    pkill -x qs 2>/dev/null || true
    sleep 1
    (setsid qs -c end4-pC >/dev/null 2>&1 &) || true
fi

cat <<EOF

✅ Done.

Next steps:
  1. Log out and back in, choosing "Hyprland" at the login screen.
  2. If this is a fresh machine, make sure the packages from the README are
     installed (the base dots installer does most of them).
  3. Open the settings panel with SUPER + Escape.
  4. Read docs/Hyprland-Setup-Guide.docx for the full guide.

Backups (if any): $BACKUP_DIR
EOF
