#!/usr/bin/env zsh

# Shell Options
# zshoptions(1)  /  http://zsh.sourceforge.net/Doc/Release/Options.html

# Navigation
# Awesome cd movements from zshkit
# ---------------------------------------------------------

# Go to folder path without using cd.
setopt AUTO_CD

# Push the old directory onto the stack on cd.
setopt AUTO_PUSHD

# Exchanges the meanings of ‘+’ and ‘-’ when used with a number to specify a directory in the stack.
setopt PUSHD_MINUS

# Do not print the directory stack after pushd or popd.
setopt PUSHD_SILENT

# Have pushd with no arguments act like ‘pushd $HOME’.
setopt PUSHD_TO_HOME

# Change directory to a path stored in a variable.
setopt CDABLE_VARS

# Keeps the directory stack from getting too large
DIRSTACKSIZE=5

# Expansion and Globbing
# ---------------------------------------------------------

# Use additional glob operators ('#', '~', and '^').
setopt EXTENDED_GLOB

# If a glob fails, the command isn't executed.
# Allow [ or ] whereever you want
setopt NOMATCH

# History
# ---------------------------------------------------------
HISTFILE="${ZDOTDIR}/.zhistory"
HISTSIZE=4096
SAVEHIST=$HISTSIZE
HISTDUP="erase"

# Write the history file in the ':start:elapsed;command' format.
setopt EXTENDED_HISTORY

# Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_ALL_DUPS

# Write commands to history file as soon as possible.
setopt INC_APPEND_HISTORY

# Append only when writing history.
setopt APPEND_HISTORY

# Share history between all sessions.
setopt SHARE_HISTORY

# Do not record an event starting with a space.
setopt HIST_IGNORE_SPACE

# Do not write a duplicate event to the history file.
setopt HIST_SAVE_NO_DUPS

# Do not record an event that was just recorded again.
setopt HIST_IGNORE_DUPS

# Do not display a previously found event.
setopt HIST_FIND_NO_DUPS
