#!/usr/bin/env bash

# Exit on error
set -e

TOOLCHAINS=("Lua" "Node.js" "Python" "Go" "Rust" "Ruby")
export CHEZMOI_FIRST_RUN_TOOLCHAINS="${TOOLCHAINS[@]}"
select_toolchain

echo "Installing toolchain packages ..."

# Neovim
mise exec node -- npm install --global neovim
mise exec python -- pip install neovim
mise exec ruby -- gem install neovim --no-document

# Ruby on Rails
mise exec ruby -- gem install rails --no-document

# Utilities
mise exec python -- pip install pipx --upgrade --user
mise exec python -- pip install awscli --upgrade --user
mise exec python -- pipx install posting
