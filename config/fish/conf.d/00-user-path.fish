# User binaries (set-avatar, refresh-wallpapers, ...) are in ~/bin and ~/.local/bin
# The Hyprland session PATH does not include them by default.
if not contains $HOME/.local/bin $PATH
    fish_add_path --global --prepend $HOME/.local/bin
end
if not contains $HOME/bin $PATH
    fish_add_path --global --prepend $HOME/bin
end
