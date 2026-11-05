-- Machine-specific tweaks.
--
-- The GPU environment is generated from *your* hardware by ~/bin/gpu-env and
-- install.sh runs it for you. Never hard-code NVIDIA / AMD / Intel values in
-- this file: on another card they point at a device that does not exist or
-- force the wrong GBM/VAAPI backend, and Hyprland fails to start or renders a
-- black screen.
--
--   ~/bin/gpu-env --write     -- detect again and rewrite the block below
--   log out and back in       -- Hyprland reads AQ_DRM_DEVICES at start-up
--
-- On a single-GPU machine the block stays empty: Hyprland and Mesa pick the
-- only card themselves. On a hybrid laptop it points the compositor at the
-- GPU that drives the internal panel.
-- >>> gpu-env >>>
-- (empty - run: ~/bin/gpu-env --write)
-- <<< gpu-env <<<

-- "en_IN" (without the .UTF-8 suffix) has no XKB compose file -> every GUI
-- app printed "xkbcommon: No Compose file for locale en_IN" warnings.
-- Replace both with your own locale if you are not in India.
hl.env("LANG", "en_IN.UTF-8")
hl.env("LC_ALL", "en_IN.UTF-8")

-- The wallpapers are 1920x1080 and the screen is 1920x1200, so the shell's
-- "upscale?" hint pops up on every switch. Keep it short so it never stalls.
hl.env("UPSCALE_PROMPT_TIMEOUT", "0.5")

-- The Hyprland session PATH is minimal; add the user bin dirs.
local user_home = os.getenv("HOME")
local path_old = os.getenv("PATH") or ""
if user_home and not string.find(path_old, user_home .. "/.local/bin", 1, true) then
    hl.env("PATH", path_old .. ":" .. user_home .. "/.local/bin:" .. user_home .. "/bin")
end
