hl.bind("CTRL+SUPER+ALT+Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"), {description = "Edit user keybinds"} )

-- Settings is an overlay panel, not a window: toggle it with the same key or Esc
hl.bind("SUPER + escape", hl.dsp.global("quickshell:settingsToggle"), { description = "Shell: Toggle settings" })

-- ---------------------------------------------------------------------------
-- Windows-style window snapping (half screen / maximize / restore)
--   SUPER + ALT + Left / Right  -> snap to the left / right half
--   SUPER + ALT + Up             -> maximize
--   SUPER + ALT + Down           -> restore (back into the tiling layout)
--   SUPER + ALT + A              -> snap to the top-left quarter
--   SUPER + ALT + D              -> snap to the bottom-right quarter
-- ---------------------------------------------------------------------------
local function snap_window(mode)
    local mon = hl.get_active_monitor()
    if not mon then return end

    local m = 8 -- margin in pixels
    local mx, my = mon.x, mon.y
    local mw, mh = mon.width, mon.height
    local half_w = math.floor(mw / 2)
    local half_h = math.floor(mh / 2)

    local x, y, w, h
    if mode == "left" then
        x, y = mx + m, my + m
        w, h = half_w - m, mh - 2 * m
    elseif mode == "right" then
        x, y = mx + half_w + m, my + m
        w, h = mw - half_w - 2 * m, mh - 2 * m
    elseif mode == "top" then
        x, y = mx + m, my + m
        w, h = mw - 2 * m, half_h - m
    elseif mode == "bottom" then
        x, y = mx + m, my + half_h + m
        w, h = mw - 2 * m, mh - half_h - 2 * m
    elseif mode == "topleft" then
        x, y = mx + m, my + m
        w, h = half_w - m, half_h - m
    elseif mode == "bottomright" then
        x, y = mx + half_w + m, my + half_h + m
        w, h = mw - half_w - 2 * m, mh - half_h - 2 * m
    else
        return
    end

    -- floating, so the size/position can be set freely
    hl.dispatch(hl.dsp.window.float({ action = "enable" }))
    hl.dispatch(hl.dsp.window.resize({ x = w, y = h }))
    hl.dispatch(hl.dsp.window.move({ x = x, y = y }))
end

hl.bind("SUPER + ALT + Left", function() snap_window("left") end, { description = "Window: Snap left half" })
hl.bind("SUPER + ALT + Right", function() snap_window("right") end, { description = "Window: Snap right half" })
hl.bind("SUPER + ALT + Up", function() snap_window("top") end, { description = "Window: Snap top half" })
hl.bind("SUPER + ALT + Down", function() snap_window("bottom") end, { description = "Window: Snap bottom half" })
hl.bind("SUPER + ALT + A", function() snap_window("topleft") end, { description = "Window: Snap top-left quarter" })
hl.bind("SUPER + ALT + D", function() snap_window("bottomright") end, { description = "Window: Snap bottom-right quarter" })

-- Back into the tiling layout (undo a snap)
hl.bind("SUPER + ALT + 0", hl.dsp.window.float({ action = "disable" }), { description = "Window: Re-tile (undo snap)" })

-- ---------------------------------------------------------------------------
-- Screenshots & screen recording.
-- These override the upstream binds, which rely on the shell's own region
-- selector overlay (unreliable in this fork). We use grim/slurp/wf-recorder
-- directly instead.
--   SUPER + SHIFT + S      -> region screenshot to the clipboard
--   SUPER + SHIFT + X      -> region -> OCR -> clipboard
--   Print                  -> full screen to the clipboard
--   CTRL + Print           -> full screen to the clipboard + file
--   SUPER + SHIFT + R      -> record a region (press again to stop)
--   CTRL + ALT + R         -> record the full screen (press again to stop)
--   SUPER + SHIFT + ALT + R-> record the full screen with system audio
-- ---------------------------------------------------------------------------
local snipScript = "$HOME/.config/hypr/custom/scripts"
local recordScript = "$HOME/.config/quickshell/end4-pC/scripts/videos/record.sh"

-- Remove the upstream binds for these combos first (the shell's own region
-- selector overlay is unreliable in this fork), then bind the CLI versions.
pcall(hl.unbind, "SUPER + SHIFT + S")
pcall(hl.unbind, "SUPER + SHIFT + X")
pcall(hl.unbind, "SUPER + SHIFT + R")
pcall(hl.unbind, "SUPER + SHIFT + ALT + R")
pcall(hl.unbind, "CTRL + ALT + R")
pcall(hl.unbind, "Print")
pcall(hl.unbind, "CTRL + Print")

hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(snipScript .. "/region-screenshot.sh"),
    { description = "Utilities: Region screenshot -> clipboard" })
hl.bind("SUPER + SHIFT + X", hl.dsp.exec_cmd(snipScript .. "/region-ocr.sh"),
    { description = "Utilities: Region OCR -> clipboard" })
hl.bind("Print", hl.dsp.exec_cmd(snipScript .. "/screen-screenshot.sh"),
    { locked = true, description = "Utilities: Full screenshot -> clipboard" })
hl.bind("CTRL + Print", hl.dsp.exec_cmd(snipScript .. "/screen-screenshot-save.sh"),
    { locked = true, non_consuming = true, description = "Utilities: Full screenshot -> clipboard + file" })

hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd(recordScript),
    { locked = true, description = "Utilities: Record a region (press again to stop)" })
hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd(recordScript .. " --fullscreen"),
    { locked = true, description = "Utilities: Record the full screen" })
hl.bind("SUPER + SHIFT + ALT + R", hl.dsp.exec_cmd(recordScript .. " --fullscreen --sound"),
    { locked = true, description = "Utilities: Record the full screen with sound" })

-- ---------------------------------------------------------------------------
-- Safety net: if a virtual modifier (Shift/Ctrl/Alt) ever gets stuck down -
-- e.g. the on-screen keyboard pressed it and the release was lost - everything
-- you type comes out in CAPS. Scroll_Lock releases every stuck key.
-- Deliberately bound to a key without modifiers, so it still works while a
-- modifier is stuck.
-- ---------------------------------------------------------------------------
hl.bind("Scroll_Lock", hl.dsp.exec_cmd("~/bin/unstick-keys"),
    { description = "System: Release stuck modifier keys" })

-- ---------------------------------------------------------------------------
-- Super pressed alone opens the search (see "SUPER + SUPER_L" in the base
-- keybinds). In Hyprland 0.57 the shell can no longer tell whether another key
-- was pressed during the hold, so pressing any SUPER+<key> shortcut also opened
-- the search. Tell the shell to cancel it whenever a non-Super key is pressed
-- while Super is held. Super alone still opens the search on release.
-- ---------------------------------------------------------------------------
hl.on("input.keyboard.key", function(keycode, timeMs, state)
    if state ~= 1 then return end -- only key presses, not releases/repeats
    -- xkb keycodes from the event are linux keycodes + 8:
    if keycode == 133 or keycode == 134 then return end -- Super_L / Super_R
    if hl.is_key_down("Super_L") or hl.is_key_down("Super_R") then
        hl.dispatch(hl.dsp.global("quickshell:searchToggleReleaseInterrupt"))
    end
end)
