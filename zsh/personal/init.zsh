# 
# -----------------------------
# Roketrakun Personal Zsh Init
# -----------------------------

# Personal folder
PERSONAL="$HOME/.config/personal"

# make sure folder exists
[[ ! -d "$PERSONAL" ]] && mkdir -p "$PERSONAL"

# -----------------------------
# Source modular configs
# -----------------------------
for file in env.zsh paths.zsh aliases.zsh funcs.zsh fzf.zsh; do
    local cfg_file="$PERSONAL/$file"
    [[ -f "$cfg_file" ]] && source "$cfg_file"
done

# -----------------------------
# Editor
# -----------------------------
export vim="nvim"

# -----------------------------
# Keybindings
# -----------------------------
bindkey -s '^f' "tmux-sessionizer\n"

# -----------------------------
# Optional: quick reload command
# -----------------------------
reload_shell() {
    echo "Reloading personal Zsh config..."
    source "$HOME/.zsh_profile"
    hash -r  # refresh command cache
    echo "Reload complete. PATH:"
    echo $PATH
}

