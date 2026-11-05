# end4-pC — Keyboard Shortcuts

**Shell:** [end4-pC](https://github.com/pctrade/end4-pC) (fork of end-4's *illogical-impulse*)
**Compositor:** Hyprland 0.56.2 · **Desktop shell:** Quickshell 0.3.2
**Generated on this machine** — the appendix at the end is the live list from `hyprctl binds`.

> **SUPER** = the Windows key.
> **SUPER + /** now opens an on-screen **cheat sheet** with every keybind, grouped by category (Esc closes it).
> You can also press **SUPER** and type `<` in the launcher to search the keybinds.
> The end4-pC **Settings** panel is an overlay (not a window): open/close it with **SUPER + Escape** or **Esc**.

---

## 0. Finding your way around (navigation)

| Where | How to navigate |
| --- | --- |
| **Launcher / search** (SUPER) | **↑ ↓** move, **Enter** run, **Esc** close, type to filter |
| **Launcher prefixes** | `<` keybinds · `>` apps · `;` clipboard · `:` emoji · `.` symbols · `=` math · `$` shell command · `?` web search · `/` actions |
| **Cheat sheet** (SUPER + /) | **Esc** closes it; the list is grouped by category |
| **Wallpaper selector** (Ctrl + SUPER + T) | **← → ↑ ↓** move between tiles, **Enter** apply, **Esc** close, **Alt + ↑ / ← / →** navigate folders, **Ctrl + F** toggle the search bar, **Ctrl + V** paste an image file |
| **Settings panel** (SUPER + Escape) | **Esc** closes it; the left column switches between pages, the top bar searches |
| **Overview** (SUPER + Tab) | **↑ ↓** pick a workspace, **Enter** switch to it, **Esc** close |
| **Overview / workspace switch** | **SUPER + 1 … 0** go to workspace 1-10, **SUPER + Alt + 1 … 0** send the window there, **Ctrl + SUPER + ← / →** previous/next workspace, **SUPER + Page Up / Page Down** or **SUPER + scroll** also switch |
| **Hold SUPER** | The workspace-number HUD appears (release to confirm) |

---

## 1. Shell & desktop (Quickshell)

| Shortcut | Action |
| --- | --- |
| **SUPER** (tap, release) | Open the launcher / search |
| **SUPER + Tab** | Overview (all workspaces) |
| **SUPER + A** | Toggle left sidebar |
| **SUPER + Alt + A** | Detach left sidebar |
| **SUPER + N** | Toggle right sidebar |
| **SUPER + V** | Clipboard history |
| **SUPER + .** | Emoji picker |
| **SUPER + /** | Cheatsheet overlay (keybind list on screen) |
| **SUPER + K** | On-screen keyboard |
| **SUPER + M** | Media controls |
| **SUPER + G** | Widget overlay |
| **SUPER + J** | Show / hide the bar |
| **SUPER + Escape** | **Settings panel** |
| **Ctrl + Alt + Delete** | Session menu (logout / reboot / shutdown) |
| **Ctrl + SUPER + T** | Change wallpaper |
| **Ctrl + SUPER + Alt + T** | Random wallpaper |
| **Ctrl + SUPER + Shift + D** | Toggle light / dark mode |
| **Ctrl + SUPER + P** | Cycle panel family (bar style) |
| **Ctrl + SUPER + R** | Restart shell widgets |
| **Shift + SUPER + Alt + /** | Welcome / onboarding window |
| **Ctrl + SUPER + Alt + /** | Open `~/.config/hypr/custom/keybinds.lua` in your editor |

### Launcher tips
* Type an app name to launch it.
* Type `<` → list **all** keybinds.
* Type `wallpaper`, `bar`, `blur`… → jumps straight to that Settings page.
* Type `=` for a calculator, `:` for commands, `?` for help.

---

## 2. Windows

### Resizing & snapping (Windows-style)

| Shortcut | Action |
| --- | --- |
| **Drag a window edge/corner** | Resize (like Windows — `resize_on_border` is on) |
| **SUPER + right-mouse-drag** | Free-form resize of the window under the cursor |
| **SUPER + left-mouse-drag** | Move the window |
| **SUPER + ALT + Left** | **Snap to the left half** |
| **SUPER + ALT + Right** | **Snap to the right half** |
| **SUPER + ALT + Up** | Snap to the top half |
| **SUPER + ALT + Down** | Snap to the bottom half |
| **SUPER + ALT + A** | Snap to the top-left quarter |
| **SUPER + ALT + D** | Snap to the bottom-right quarter |
| **SUPER + ALT + 0** | Re-tile the window (undo a snap) |
| **Drag a window to a screen edge** | Auto-snaps to that half (pseudo-snap) |
| **SUPER + D** | Maximize |
| **SUPER + F** | True fullscreen |
| **SUPER + Alt + Space** | Toggle floating / tiled |

> Snapping temporarily makes the window floating so it can be sized and placed freely; **SUPER + ALT + 0** puts it back into the tiling layout.

### Moving & focusing

| Shortcut | Action |
| --- | --- |
| **SUPER + ← / → / ↑ / ↓** | Focus window in that direction |
| **SUPER + Shift + ← / → / ↑ / ↓** | Move window in that direction |
| **SUPER + Q** | Close window |
| **SUPER + Shift + Alt + Q** | Force-kill (zap) a window |
| **SUPER + Alt + Space** | Toggle floating / tiled |
| **SUPER + D** | Maximize (toggle) |
| **SUPER + F** | True fullscreen (toggle) |
| **SUPER + Alt + F** | Fake fullscreen (spoof) |
| **SUPER + P** | Pin window (show on all workspaces) |
| **SUPER + ;** / **SUPER + '** | Shrink / grow split ratio |
| **Ctrl + SUPER + \\** | Resize window to 640 × 480 |
| **SUPER + Alt + F1** | Enter/leave VM mode (disables most keybinds) |

---

## 3. Workspaces

| Shortcut | Action |
| --- | --- |
| **SUPER + 1 … 0** | Switch to workspace 1 … 10 |
| **SUPER + Alt + 1 … 0** | Move active window to workspace 1 … 10 |
| **Ctrl + SUPER + ← / →** | Previous / next workspace |
| **SUPER + Page Up / Page Down** | Previous / next workspace |
| **SUPER + scroll** | Previous / next workspace |
| **SUPER + Shift + scroll** | Send window to workspace left / right |
| **SUPER + S** | Toggle scratchpad (special workspace) |
| **SUPER + Alt + S** | Send window to scratchpad |
| **Ctrl + SUPER + S** | Toggle scratchpad visibility |
| **Ctrl + SUPER + ← / →** | Workspace −1 / +1 |
| **Ctrl + SUPER + ↑ / ↓** | Jump 5 workspaces up / down |
| Hold **SUPER** | Shows the workspace numbers HUD |

---

## 4. Screenshots, recording & utilities

> These were re-wired to use `grim` / `slurp` / `wf-recorder` directly, because the
> shell's own region-selector overlay was unreliable in this fork.

| Shortcut | Action |
| --- | --- |
| **Print** | Full screenshot → clipboard (image/png) |
| **Ctrl + Print** | Full screenshot → clipboard **and** file in `~/Pictures/Screenshots` |
| **SUPER + Shift + S** | **Region screenshot** → clipboard (drag to select) |
| **SUPER + Shift + X** | Region → **OCR** → clipboard (tesseract) |
| **SUPER + Shift + A** | Region → Google Lens (image search) |
| **SUPER + Shift + T** | Translate text on screen |
| **SUPER + Shift + C** | Colour picker (hex → clipboard) |
| **SUPER + Shift + R** | **Record a region** → `~/Videos` (press again to stop) |
| **Ctrl + Alt + R** | **Record the full screen** (press again to stop) |
| **SUPER + Shift + Alt + R** | Record the full screen **with system audio** |
| **SUPER + Shift + Alt + mouse back** | AI summary of selected text (needs Ollama) |

**Recording notes**
* Files land in `~/Videos/recording_<date>.mp4`.
* Press the same key again to stop the recording.
* Region recording asks you to drag a selection first; fullscreen recording starts instantly.
* `--sound` records the system audio (PipeWire monitor), `--mic` the microphone.

**Screenshot scripts** (also usable directly)

```bash
~/.config/hypr/custom/scripts/region-screenshot.sh        # region -> clipboard
~/.config/hypr/custom/scripts/screen-screenshot.sh        # full screen -> clipboard
~/.config/hypr/custom/scripts/screen-screenshot-save.sh   # full screen -> clipboard + file
~/.config/hypr/custom/scripts/region-ocr.sh               # region -> OCR -> clipboard
```

---

## 5. Media, volume & display

| Shortcut | Action |
| --- | --- |
| **Volume Up / Down** | Volume ±2 % |
| **Mute** | Mute output |
| **Mic Mute** / **Alt + Mic Mute** | Mute microphone |
| **Brightness Up / Down** | Screen brightness |
| **SUPER + Shift + N** | Next track |
| **SUPER + Shift + B** | Previous track |
| **SUPER + Shift + P** | Play / pause |
| **SUPER + Shift + M** | Mute output |
| **SUPER + Alt + M** | Mute microphone |
| **SUPER + −** / **SUPER + =** | Zoom out / in (magnifier) |

---

## 6. Session & power

| Shortcut | Action |
| --- | --- |
| **SUPER + L** | Lock screen |
| **SUPER + Shift + L** | Suspend |
| **Ctrl + Alt + Delete** | Session menu (logout / reboot / shutdown) |
| **Ctrl + Shift + Alt + SUPER + Delete** | Power off immediately |

---

## 7. Applications

| Shortcut | Action |
| --- | --- |
| **SUPER + Return** / **SUPER + T** / **Ctrl + Alt + T** | Terminal |
| **SUPER + E** | File manager (Dolphin) |
| **SUPER + W** | Web browser |
| **SUPER + C** | Code editor |
| **SUPER + X** | Text editor |
| **SUPER + I** | Settings app |
| **Ctrl + SUPER + V** | Volume mixer |
| **Ctrl + Shift + Esc** | Task manager |
| **Ctrl + SUPER + Shift + Alt + W** | Office suite |

Each of these picks the first *installed* app from a list (e.g. `foot` → `kitty` → `alacritty` …). Change them in `~/.config/hypr/custom/variables.lua`.

---

## 8. Mouse

| Shortcut | Action |
| --- | --- |
| **SUPER + left-drag** | Move window |
| **SUPER + right-drag** | Resize window |
| **SUPER + scroll** | Switch workspace |
| **SUPER + Shift + scroll** | Send window to workspace |
| **SUPER + Alt + scroll** | Send window to workspace (reverse) |

---

## 9. Customising the shortcuts

| File | Purpose |
| --- | --- |
| `~/.config/hypr/hyprland/keybinds.lua` | Default keybinds (replaced on dotfile update) |
| `~/.config/hypr/custom/keybinds.lua` | **Put your own binds here** — update-safe |
| `~/.config/hypr/hyprland/variables.lua` | Default app choices, `qsConfig` |
| `~/.config/hypr/custom/variables.lua` | Your own app / env overrides (update-safe) |
| `~/.config/hypr/custom/env.lua` | Machine-specific env (GPU block generated by `~/bin/gpu-env`) |

* Open your custom keybinds: **Ctrl + SUPER + Alt + /**
* Apply Hyprland config changes: `hyprctl reload`
* Restart only the shell: **Ctrl + SUPER + R**
* On-screen cheat sheet: **SUPER + /**
* Live list of every binding: `hyprctl binds`

Example custom bind:

```lua
hl.bind("SUPER + Escape", hl.dsp.global("quickshell:settingsToggle"),
        { description = "Shell: Toggle settings" })
```

---

## 10. Useful commands

```bash
hyprctl reload              # reload the Hyprland config
hyprctl binds               # list every active keybind
hyprctl clients             # list open windows
hyprctl monitors            # display info
qs -c end4-pC               # start/restart the end4-pC shell
qs -c end4-pC ipc call settingsToggle   # open the settings panel
```

---

## 11. Appendix — every active binding on this machine

Generated live from `hyprctl binds` while running Hyprland on this laptop.

| Shortcut | Action |
| --- | --- |
| `SUPER + W` | App: Browser |
| `SUPER + C` | App: Code editor |
| `SUPER + E` | App: File manager |
| `SHIFT + CTRL + ALT + SUPER + W` | App: Office software |
| `SUPER + I` | App: Settings app |
| `SHIFT + CTRL + Escape` | App: Task manager |
| `SUPER + Return` | App: Terminal |
| `SUPER + X` | App: Text editor |
| `CTRL + SUPER + V` | App: Volume mixer |
| `CTRL + ALT + SUPER + Slash` | Edit user keybinds |
| `SHIFT + SUPER + N` | Media: Next track |
| `SHIFT + SUPER + P` | Media: Play/pause media |
| `SHIFT + SUPER + B` | Media: Previous track |
| `ALT + SUPER + M` | Media: Toggle mic |
| `SHIFT + SUPER + M` | Media: Toggle mute |
| `SUPER + Equal` | Screen: Zoom in |
| `SUPER + Minus` | Screen: Zoom out |
| `SUPER + L` | Session: Lock |
| `SHIFT + CTRL + ALT + SUPER + Delete` | Session: Shut down |
| `SHIFT + SUPER + L` | Session: Sleep |
| `CTRL + SUPER + T` | Shell: Change wallpaper |
| `CTRL + SUPER + P` | Shell: Cycle panel family |
| `CTRL + ALT + SUPER + T` | Shell: Random wallpaper |
| `CTRL + SUPER + R` | Shell: Restart widgets |
| `SUPER + J` | Shell: Toggle bar |
| `SUPER + Slash` | Shell: Toggle cheatsheet |
| `SUPER + A` | Shell: Toggle left sidebar |
| `SHIFT + CTRL + SUPER + D` | Shell: Toggle light/dark mode |
| `SUPER + M` | Shell: Toggle media controls |
| `SUPER + K` | Shell: Toggle on-screen keyboard |
| `SUPER + Tab` | Shell: Toggle overview |
| `SUPER + N` | Shell: Toggle right sidebar |
| `SUPER + SUPER_L` | Shell: Toggle search |
| `CTRL + ALT + Delete` | Shell: Toggle session menu |
| `SUPER + escape` | Shell: Toggle settings |
| `SUPER + G` | Shell: Toggle widget overlay |
| `SUPER + V` | Utilities: Clipboard history >> clipboard |
| `SUPER + Period` | Utilities: Emoji >> clipboard |
| `Print` | Utilities: Full screenshot -> clipboard |
| `CTRL + Print` | Utilities: Full screenshot -> clipboard + file |
| `SHIFT + ALT + SUPER + mouse:273` | Utilities: Generate AI summary for selected text |
| `SHIFT + SUPER + A` | Utilities: Google Lens |
| `SHIFT + SUPER + C` | Utilities: Pick color #RRGGBB >> clipboard |
| `SHIFT + SUPER + R` | Utilities: Record a region (press again to stop) |
| `CTRL + ALT + R` | Utilities: Record the full screen |
| `SHIFT + ALT + SUPER + R` | Utilities: Record the full screen with sound |
| `SHIFT + SUPER + X` | Utilities: Region OCR -> clipboard |
| `SHIFT + SUPER + S` | Utilities: Region screenshot -> clipboard |
| `SHIFT + SUPER + T` | Utilities: Translate screen content |
| `SUPER + Q` | Window: Close |
| `ALT + SUPER + Space` | Window: Float/Tile |
| `SUPER + Down` | Window: Focus Down |
| `SUPER + Left` | Window: Focus Left |
| `SUPER + Right` | Window: Focus Right |
| `SUPER + Up` | Window: Focus Up |
| `SHIFT + ALT + SUPER + Q` | Window: Forcefully zap a window |
| `SUPER + F` | Window: Fullscreen |
| `ALT + SUPER + F` | Window: Fullscreen spoof |
| `SUPER + D` | Window: Maximize |
| `SUPER + mouse:272` | Window: Move |
| `SHIFT + SUPER + Down` | Window: Move Down |
| `SHIFT + SUPER + Left` | Window: Move Left |
| `SHIFT + SUPER + Right` | Window: Move Right |
| `SHIFT + SUPER + Up` | Window: Move Up |
| `SUPER + P` | Window: Pin |
| `ALT + SUPER + 0` | Window: Re-tile (undo snap) |
| `SUPER + mouse:273` | Window: Resize |
| `ALT + SUPER + S` | Window: Send to scratchpad |
| `ALT + SUPER + 1` | Window: Send to workspace 1 |
| `ALT + SUPER + 0` | Window: Send to workspace 10 |
| `ALT + SUPER + 2` | Window: Send to workspace 2 |
| `ALT + SUPER + 3` | Window: Send to workspace 3 |
| `ALT + SUPER + 4` | Window: Send to workspace 4 |
| `ALT + SUPER + 5` | Window: Send to workspace 5 |
| `ALT + SUPER + 6` | Window: Send to workspace 6 |
| `ALT + SUPER + 7` | Window: Send to workspace 7 |
| `ALT + SUPER + 8` | Window: Send to workspace 8 |
| `ALT + SUPER + 9` | Window: Send to workspace 9 |
| `SHIFT + SUPER + Page_Up` | Window: Send to workspace left |
| `SHIFT + SUPER + Page_Down` | Window: Send to workspace right |
| `ALT + SUPER + Down` | Window: Snap bottom half |
| `ALT + SUPER + D` | Window: Snap bottom-right quarter |
| `ALT + SUPER + Left` | Window: Snap left half |
| `ALT + SUPER + Right` | Window: Snap right half |
| `ALT + SUPER + Up` | Window: Snap top half |
| `ALT + SUPER + A` | Window: Snap top-left quarter |
| `SUPER + 1` | Workspace: Focus 1 |
| `SUPER + 0` | Workspace: Focus 10 |
| `SUPER + 2` | Workspace: Focus 2 |
| `SUPER + 3` | Workspace: Focus 3 |
| `SUPER + 4` | Workspace: Focus 4 |
| `SUPER + 5` | Workspace: Focus 5 |
| `SUPER + 6` | Workspace: Focus 6 |
| `SUPER + 7` | Workspace: Focus 7 |
| `SUPER + 8` | Workspace: Focus 8 |
| `SUPER + 9` | Workspace: Focus 9 |
| `CTRL + SUPER + Left` | Workspace: Focus left |
| `CTRL + SUPER + Right` | Workspace: Focus right |
| `SUPER + S` | Workspace: Toggle scratchpad |
| `ALT + F4` | _(no description)_ |
| `ALT + SUPER + A` | _(no description)_ |
| `ALT + SUPER + Equal` | _(no description)_ |
| `ALT + SUPER + F1` | _(no description)_ _(submap: virtual-machine)_ |
| `ALT + SUPER + F11` | _(no description)_ |
| `ALT + SUPER + F12` | _(no description)_ |
| `ALT + SUPER + Page_down` | _(no description)_ |
| `ALT + SUPER + Page_up` | _(no description)_ |
| `ALT + SUPER + R` | _(no description)_ |
| `ALT + SUPER + R` | _(no description)_ |
| `ALT + SUPER + SUPER + ALT + code:79` | _(no description)_ |
| `ALT + SUPER + SUPER + ALT + code:80` | _(no description)_ |
| `ALT + SUPER + SUPER + ALT + code:81` | _(no description)_ |
| `ALT + SUPER + SUPER + ALT + code:83` | _(no description)_ |
| `ALT + SUPER + SUPER + ALT + code:84` | _(no description)_ |
| `ALT + SUPER + SUPER + ALT + code:85` | _(no description)_ |
| `ALT + SUPER + SUPER + ALT + code:87` | _(no description)_ |
| `ALT + SUPER + SUPER + ALT + code:88` | _(no description)_ |
| `ALT + SUPER + SUPER + ALT + code:89` | _(no description)_ |
| `ALT + SUPER + SUPER + ALT + code:90` | _(no description)_ |
| `ALT + SUPER + mouse_down` | _(no description)_ |
| `ALT + SUPER + mouse_up` | _(no description)_ |
| `ALT + XF86AudioMute` | _(no description)_ |
| `CTRL + ALT + Delete` | _(no description)_ |
| `CTRL + ALT + SUPER + Left` | _(no description)_ |
| `CTRL + ALT + SUPER + Right` | _(no description)_ |
| `CTRL + ALT + T` | _(no description)_ |
| `CTRL + SUPER + Backslash` | _(no description)_ |
| `CTRL + SUPER + BracketLeft` | _(no description)_ |
| `CTRL + SUPER + BracketRight` | _(no description)_ |
| `CTRL + SUPER + Down` | _(no description)_ |
| `CTRL + SUPER + Page_Down` | _(no description)_ |
| `CTRL + SUPER + Page_Up` | _(no description)_ |
| `CTRL + SUPER + S` | _(no description)_ |
| `CTRL + SUPER + T` | _(no description)_ |
| `CTRL + SUPER + Up` | _(no description)_ |
| `CTRL + SUPER + mouse_down` | _(no description)_ |
| `CTRL + SUPER + mouse_up` | _(no description)_ |
| `SHIFT + ALT + SUPER + Slash` | _(no description)_ |
| `SHIFT + ALT + SUPER + mouse:275` | _(no description)_ |
| `SHIFT + ALT + SUPER + mouse:276` | _(no description)_ |
| `SHIFT + CTRL + SUPER + Left` | _(no description)_ |
| `SHIFT + CTRL + SUPER + Right` | _(no description)_ |
| `SHIFT + SUPER + A` | _(no description)_ |
| `SHIFT + SUPER + mouse_down` | _(no description)_ |
| `SHIFT + SUPER + mouse_up` | _(no description)_ |
| `SUPER + Apostrophe` | _(no description)_ |
| `SUPER + B` | _(no description)_ |
| `SUPER + BracketLeft` | _(no description)_ |
| `SUPER + BracketRight` | _(no description)_ |
| `SUPER + O` | _(no description)_ |
| `SUPER + Page_Down` | _(no description)_ |
| `SUPER + Page_Up` | _(no description)_ |
| `SUPER + Period` | _(no description)_ |
| `SUPER + SUPER + code:10` | _(no description)_ |
| `SUPER + SUPER + code:11` | _(no description)_ |
| `SUPER + SUPER + code:12` | _(no description)_ |
| `SUPER + SUPER + code:13` | _(no description)_ |
| `SUPER + SUPER + code:14` | _(no description)_ |
| `SUPER + SUPER + code:15` | _(no description)_ |
| `SUPER + SUPER + code:16` | _(no description)_ |
| `SUPER + SUPER + code:17` | _(no description)_ |
| `SUPER + SUPER + code:18` | _(no description)_ |
| `SUPER + SUPER + code:19` | _(no description)_ |
| `SUPER + SUPER + code:79` | _(no description)_ |
| `SUPER + SUPER + code:80` | _(no description)_ |
| `SUPER + SUPER + code:81` | _(no description)_ |
| `SUPER + SUPER + code:82` | _(no description)_ |
| `SUPER + SUPER + code:83` | _(no description)_ |
| `SUPER + SUPER + code:84` | _(no description)_ |
| `SUPER + SUPER + code:85` | _(no description)_ |
| `SUPER + SUPER + code:86` | _(no description)_ |
| `SUPER + SUPER + code:87` | _(no description)_ |
| `SUPER + SUPER + code:88` | _(no description)_ |
| `SUPER + SUPER + code:89` | _(no description)_ |
| `SUPER + SUPER + code:90` | _(no description)_ |
| `SUPER + SUPER_L` | _(no description)_ |
| `SUPER + SUPER_R` | _(no description)_ |
| `SUPER + SUPER_R` | _(no description)_ |
| `SUPER + Semicolon` | _(no description)_ |
| `SUPER + T` | _(no description)_ |
| `SUPER + V` | _(no description)_ |
| `SUPER + mouse:274` | _(no description)_ |
| `SUPER + mouse:275` | _(no description)_ |
| `SUPER + mouse_down` | _(no description)_ |
| `SUPER + mouse_up` | _(no description)_ |
| `SUPER_L` | _(no description)_ |
| `SUPER_L` | _(no description)_ |
| `SUPER_R` | _(no description)_ |
| `SUPER_R` | _(no description)_ |
| `XF86AudioLowerVolume` | _(no description)_ |
| `XF86AudioMicMute` | _(no description)_ |
| `XF86AudioMute` | _(no description)_ |
| `XF86AudioNext` | _(no description)_ |
| `XF86AudioPause` | _(no description)_ |
| `XF86AudioPlay` | _(no description)_ |
| `XF86AudioPrev` | _(no description)_ |
| `XF86AudioRaiseVolume` | _(no description)_ |
| `XF86MonBrightnessDown` | _(no description)_ |
| `XF86MonBrightnessUp` | _(no description)_ |

_Total active bindings: 199_
