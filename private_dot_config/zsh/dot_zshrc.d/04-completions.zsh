#!/usr/bin/env zsh

# Initialize completions for session
autoload -Uz compinit
compinit

# Tell zinit to replay all cached completions
zinit cdreplay -q

# Styling

# Complete based on case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Colors for files and directory
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Disable default zshell completion menu
zstyle ':completion:*' menu no

# Show preview when completing cd options
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Show preview when completing with zoxide
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'