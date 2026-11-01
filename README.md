<div align="center">

# 🌌 Honkai Impact 3rd Part 2 — inspired Hyprland setup

**A Material You desktop for CachyOS / Arch Linux**
Hyprland 0.57 · Quickshell (end4-pC fork) · Matugen · Tokyo Night

[![Hyprland](https://img.shields.io/badge/Hyprland-0.57-58E1FF?style=flat-square)](https://hyprland.org)
[![Quickshell](https://img.shields.io/badge/Quickshell-0.3.2-7AA2F7?style=flat-square)](https://quickshell.org)
[![Arch](https://img.shields.io/badge/Arch%20%2F%20CachyOS-rolling-1793D1?style=flat-square)](https://cachyos.org)
[![Theme](https://img.shields.io/badge/theme-Tokyo%20Night-1A1B26?style=flat-square)](#theming)

<img src="wallpapers/9a7bf1442f19461c46b1d94b2d9dd7e2_1398637448496280117.png" alt="Desktop wallpaper" width="100%">

</div>

---

## ✨ What this is

My personal Hyprland desktop, rebuilt from scratch on **CachyOS**. It pairs the
[end-4 / illogical-impulse](https://github.com/end-4/dots-hyprland) ecosystem
with the [end4-pC](https://github.com/pctrade/end4-pC) Quickshell fork, then
layers on my own layout, keybinds, scripts and a **Honkai Impact 3rd Part 2**
wallpaper collection.

Everything is here: the Hyprland Lua config, the Quickshell shell config, helper
scripts, the wallpapers and the avatar. The only thing you need to bring is the
base installation (packages and the upstream dots).

> **Included:** 19 wallpapers, avatar, complete `~/.config/hypr`, shell
> `config.json`, 3 helper scripts, the local end4-pC patch and a 90+ page
> documentation book (`docs/Hyprland-Setup-Guide.docx`).

---

## 🖼️ Gallery

| | |
|:---:|:---:|
| <img src="wallpapers/9a7bf1442f19461c46b1d94b2d9dd7e2_1398637448496280117.png" width="420"> | <img src="wallpapers/fc2767a1d25b01116e7cb72932fabe44_2145641096946670015.jpg" width="420"> |
| Current wallpaper | Lock screen wallpaper |
| <img src="wallpapers/68f5abee69391c182f64bfdf207bb700_3299530302703659607.png" width="420"> | <img src="wallpapers/b8202414ebc2ff61bad13921667b5592_4702179676566974842.png" width="420"> |
| Sidebar banner | Included wallpaper |
| <img src="wallpapers/f22ce14d22c327f84130cb108d83047f_6056868951584389272.png" width="420"> | <img src="wallpapers/cbab17598cb20af49e77e8d0b3e6d42a_3897991262426332582.png" width="420"> |

<p align="center">
  <img src="avatar/avatar.png" width="140" alt="Avatar">
  <br><sub>Profile avatar (also installed as <code>~/.face</code>)</sub>
</p>

All wallpapers live in [`wallpapers/`](wallpapers). Game artwork © HoYoverse /
miHoYo — included for personal, non-commercial use only.

---

## 🧩 The stack

| Layer | What is used |
|---|---|
| Compositor | **Hyprland 0.57** — native Lua config (`hyprland.lua`) |
| Desktop shell | **Quickshell 0.3.2** running the **end4-pC** fork of illogical-impulse |
| Bar / widgets | Quickshell QML — bar, desktop widgets, floating dock, overview, sidebars |
| Colour engine | **Matugen 4.2** — Material You palettes from the wallpaper |
| Current palette | **Tokyo Night** named scheme (`#1A1B26` surface, `#C0CAF5` text) |
| Launcher / search | Quickshell overview (`SUPER` alone) |
| Notifications | Quickshell notification server (+ optional popups) |
| Lock / idle | Quickshell lock screen + **hypridle** |
| Clipboard | **cliphist** + `wl-paste` watchers |
| Input injection | **ydotool** (on-screen keyboard, paste helper) |
| Screenshots | **grim**, **slurp**, **wf-recorder**, **tesseract** (OCR) |
| Terminal | **Kitty**, **foot**, **fish** |
| Fonts | Google Sans Flex, JetBrains Mono NF, Space Grotesk, Readex Pro, Material Symbols Rounded |
| Cursor | Bibata Modern Classic |

### Why Quickshell and not eww/waybar?

The original end-4 dots moved from **eww/AGS** to **Quickshell**. Quickshell is
a Wayland-native Qt/QML shell: every panel is a QML file, colors come from a
single Material theme singleton, and the whole desktop (bar, dock, lock screen,
notifications, OSD, on-screen keyboard, wallpapers) is one process. There is no
`eww` or `waybar` in this setup and nothing to configure in YAML/SCSS — the UI
lives in `~/.config/quickshell/end4-pC` and its settings in
`~/.config/illogical-impulse/config.json`.

---

## ✅ Requirements

- **Arch Linux or an Arch derivative** (tested on CachyOS). Debian/Fedora are
  not supported by the upstream installer.
- A Wayland-capable GPU. This setup was tuned on a **hybrid Intel + NVIDIA
  RTX 4050** laptop (the internal panel is driven by the Intel GPU).
- An **AUR helper** (`paru` or `yay`) for the `illogical-impulse-*` packages.
- ~2 GB free disk space (the Quickshell build is the big part).

### Extra packages used by this repo

```bash
paru -S --needed hyprland hypridle hyprlock hyprsunset hyprpicker \
  quickshell-git matugen cliphist wl-clipboard ydotool grim slurp wf-recorder \
  tesseract tesseract-data-eng imagemagick jq ffmpeg cava easyeffects \
  fuzzel kitty foot fish dolphin brightnessctl playerctl \
  illogical-impulse-fonts-themes illogical-impulse-quickshell-git
```

> `illogical-impulse-quickshell-git` is the patched Quickshell build from the
> end-4 AUR set. The fork **requires** it (it uses Hyprland global shortcuts
> that stock `quickshell` does not expose the same way).

---

## 🚀 Installation

### 1. Install the base (illogical-impulse)

The shell needs the upstream dots for fonts, Python venv, themes and helper
scripts:

```bash
git clone https://github.com/end-4/dots-hyprland
cd dots-hyprland
./setup install
```

Pick your GPU options when asked. When it finishes, you have a working `ii`
shell. Log out and back in (choose **Hyprland** in the login screen) to verify
it before continuing.

### 2. Clone this repo

```bash
git clone https://github.com/Pushkar7270/HonkaiImpact3rd-part-2-inspired-hyprland-setup.git
cd HonkaiImpact3rd-part-2-inspired-hyprland-setup
```

### 3. Run the installer

```bash
./install.sh
```

The script will:

1. back up anything it is about to replace (to `~/.config-backup-<timestamp>`),
2. copy `config/hypr` → `~/.config/hypr`,
3. copy the shell `config.json` → `~/.config/illogical-impulse/config.json`,
4. install `local/bin/*` → `~/bin` and the fish PATH snippet,
5. copy all wallpapers → `~/Pictures/Wallpapers` and create the
   `~/Wallpapers` symlink,
6. install the avatar as `~/.config/quickshell/avatar/avatar.png` and `~/.face`,
7. clone **end4-pC** to `~/.config/quickshell/end4-pC` and apply
   `docs/end4-pC-local.patch` (the local widget/cheatsheet/on-screen-keyboard
   fixes),
8. point `qsConfig` at `end4-pC` and restart the shell.

Then log out and back in once. That's it.

### Manual installation (if you prefer to do it by hand)

```bash
# 1. shell fork + local patch
git clone https://github.com/pctrade/end4-pC.git ~/.config/quickshell/end4-pC
git -C ~/.config/quickshell/end4-pC checkout 6b4485b
git -C ~/.config/quickshell/end4-pC apply ~/path/to/docs/end4-pC-local.patch

# 2. configs
cp -a config/hypr ~/.config/hypr
cp config/illogical-impulse/config.json ~/.config/illogical-impulse/config.json

# 3. wallpapers + avatar
mkdir -p ~/Pictures/Wallpapers
cp wallpapers/* ~/Pictures/Wallpapers/
ln -sfn ~/Pictures/Wallpapers ~/Wallpapers
cp avatar/avatar.png ~/.config/quickshell/avatar/avatar.png
cp avatar/face.jpg ~/.face

# 4. helpers
cp local/bin/* ~/bin/ && chmod +x ~/bin/*

# 5. select the shell
echo 'hl.env("qsConfig", "end4-pC")' > ~/.config/hypr/custom/variables.lua

# 6. restart
hyprctl reload && killall qs; qs -c end4-pC & disown
```

The `config.json` and the Hyprland scripts contain absolute paths
(`/home/dreamseeker/...`). `install.sh` rewrites them to your `$HOME`
automatically; if you copy manually, run:

```bash
sed -i "s|/home/dreamseeker|$HOME|g" \
  ~/.config/illogical-impulse/config.json \
  ~/.config/hypr/custom/env.lua
```

---

## ⌨️ Shortcuts (the important ones)

| Keys | Action |
|---|---|
| `SUPER` (tap) | Search / overview |
| `SUPER + Return` | Terminal |
| `SUPER + W` | Browser |
| `SUPER + E` | File manager (Dolphin) |
| `SUPER + I` | Settings app |
| `SUPER + Escape` | Open/close the shell settings panel |
| `SUPER + /` | Cheat sheet (all 100+ binds) |
| `SUPER + A` / `SUPER + N` | Left / right sidebar |
| `SUPER + Tab` | Workspace overview |
| `SUPER + V` | Clipboard history |
| `SUPER + Period` | Emoji picker |
| `SUPER + J` | Toggle the bar |
| `SUPER + K` | On-screen keyboard |
| `SUPER + M` | Media controls |
| `SUPER + L` | Lock |
| `CTRL + ALT + Delete` | Session menu |
| `CTRL + SUPER + T` | Change wallpaper |
| `CTRL + SUPER + P` | Switch panel family (ii ↔ waffle) |
| `SUPER + SHIFT + S` | Region screenshot → clipboard |
| `SUPER + SHIFT + X` | Region OCR → clipboard |
| `Print` | Full screenshot → clipboard |
| `SUPER + SHIFT + R` | Record region (again to stop) |
| `SUPER + ALT + ←/→/↑/↓` | Snap windows (Windows-style) |
| `Scroll_Lock` | Release stuck modifier keys |

The complete, auto-generated list is in
[`docs/end4-pC-Shortcuts.md`](docs/end4-pC-Shortcuts.md), and the live list is
one keystroke away: **`SUPER + /`**.

---

## 🎨 Theming

The whole UI is Material You. One palette drives the bar, widgets, dock, lock
screen, GTK apps, Qt apps, terminals and fuzzel.

```
wallpaper ──► matugen ──► ~/.local/state/quickshell/user/generated/colors.json
                      ├──► ~/.config/hypr/hyprland/colors.lua
                      ├──► ~/.config/hypr/hyprlock/colors.conf
                      ├──► ~/.config/gtk-3.0/gtk.css / gtk-4.0/gtk.css
                      ├──► ~/.config/fuzzel/fuzzel_theme.ini
                      └──► KDE colour scheme, terminal sequences
```

- **Quick change:** Settings (`SUPER + Escape`) → *Interface* → palette /
  wallpaper / fonts.
- **Named scheme:** Settings → *Interface* → *Color Schemes* → pick
  `Tokyo Night`, `Catppuccin`, `Nord`, `Gruvbox`, `Dracula`, `Everforest`,
  `One Dark`, `Rosé Pine`. They live in
  `~/.config/quickshell/end4-pC/scripts/colors/schemes/*.json`; your own go to
  `~/.config/illogical-impulse/schemes/`.
- **Wallpaper-derived:** set `appearance.palette.type` to `auto` (or
  `scheme-content`, `scheme-expressive`, …) and switch wallpaper.
- **Create a new theme:** the 40-page guide in
  [`docs/Hyprland-Setup-Guide.docx`](docs/Hyprland-Setup-Guide.docx) has a
  step-by-step chapter (palette JSON format, matugen templates, Hyprland colours,
  lock screen, GTK/Qt/terminal, fonts and shapes).

The current theme is **Tokyo Night**, applied at
`~/.config/illogical-impulse/config.json → appearance.palette.namedScheme`.

---

## 📁 Repository layout

```
.
├── config/
│   ├── hypr/                    # ~/.config/hypr (Lua config, rules, keybinds, lock)
│   ├── illogical-impulse/
│   │   └── config.json          # shell settings (bar, widgets, dock, theme…)
│   └── fish/conf.d/             # PATH snippet for ~/bin + ~/.local/bin
├── local/bin/                   # refresh-wallpapers, set-avatar, unstick-keys
├── wallpapers/                  # 19 Honkai Impact 3rd wallpapers
├── avatar/                      # avatar.png + face.jpg
├── docs/
│   ├── Hyprland-Setup-Guide.docx   # the 90+ page documentation book
│   ├── end4-pC-Shortcuts.md        # every keybind
│   └── end4-pC-local.patch         # local changes on top of the fork
├── install.sh
└── README.md
```

### What is custom vs upstream?

| Path | Origin |
|---|---|
| `config/hypr/hyprland/*` | end-4 dots (Lua config) |
| `config/hypr/custom/*` | **mine** — machine env, snapping, screenshots, Super fix |
| `config/illogical-impulse/config.json` | **mine** — layout, widgets, Tokyo Night |
| `docs/end4-pC-local.patch` | **mine** — waffle panel port, cheatsheet, ydotool fixes |
| end4-pC shell | [pctrade/end4-pC](https://github.com/pctrade/end4-pC) |
| dots / fonts / venv | [end-4/dots-hyprland](https://github.com/end-4/dots-hyprland) |

---

## 🛠️ Troubleshooting

| Symptom | Fix |
|---|---|
| `hyprctl configerrors` shows something | check the line number; most errors come from a value above a new Hyprland limit |
| Shell does not start | `qs -c end4-pC` in a terminal and read the output; logs in `/run/user/$UID/quickshell/by-id/*/log.log` |
| Wallpaper switch stalls | the `notify-send` upscale prompt — this repo already patches it |
| Stale wallpaper thumbnails | `~/bin/refresh-wallpapers` |
| Everything types in CAPS | `Scroll_Lock` (releases stuck virtual modifiers) |
| Blurry/oversized UI on a hybrid GPU | edit `config/hypr/custom/env.lua` (`AQ_DRM_DEVICES`, `NVD_BACKEND`) |
| `SUPER+<key>` also opens search | fixed by the `input.keyboard.key` handler in `custom/keybinds.lua` |

More detail — logs, GPU setup, portals, locale, memory tuning — is in the docx.

---

## 🙏 Credits

- **[end-4](https://github.com/end-4/dots-hyprland)** — illogical-impulse, the
  original design, QML modules and scripts (GPL-3.0).
- **[pctrade](https://github.com/pctrade/end4-pC)** — the end4-pC Quickshell fork.
- **[Quickshell](https://quickshell.org)** — the shell framework.
- **[Hyprland](https://hyprland.org)** — the compositor.
- **[Matugen](https://github.com/InioX/matugen)** — Material You colour generation.
- **miHoYo / HoYoverse** — Honkai Impact 3rd artwork (wallpapers only, not mine).

## 📄 License

Configuration files, scripts and documentation: **GPL-3.0**, matching the
upstream projects. Wallpapers and avatar are personal/fan content and are not
covered by that license — please keep them for personal use.

---

<div align="center">
<sub>Built on CachyOS · Hyprland 0.57 · Quickshell 0.3.2 · Tokyo Night</sub>
</div>
