-- Local tweaks for this machine (laptop: Intel iGPU + NVIDIA RTX 4050, hybrid)
-- The internal panel is driven by the Intel GPU (eDP is connected to card1),
-- so point Hyprland/aquamarine at it and keep the NVIDIA card for apps only.
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1")
hl.env("NVD_BACKEND", "direct")
hl.env("LIBVA_DRIVER_NAME", "iHD")

-- "en_IN" (without the .UTF-8 suffix) has no XKB compose file -> every GUI
-- app printed "xkbcommon: No Compose file for locale en_IN" warnings.
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
