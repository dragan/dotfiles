# Convention is to install any ZSH functions outside of
# our control in '$HOME/.local/share/zsh/functions'.
# Make sure they are loaded before any configs are
# sourced.
fpath=( "$HOME/.local/share/zsh/functions" $fpath )
