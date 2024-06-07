#!/usr/bin/env zsh

# Shell Options
# zshoptions(1)  /  http://zsh.sourceforge.net/Doc/Release/Options.html

# Navigation
# ---------------------------------------------------------

# Go to folder path without using cd.
setopt AUTO_CD

# Push the old directory onto the stack on cd.
setopt AUTO_PUSHD

# Do not store duplicates in the stack.
setopt PUSHD_IGNORE_DUPS

# Do not print the directory stack after pushd or popd.
setopt PUSHD_SILENT

# Spelling correction
setopt CORRECT

# Change directory to a path stored in a variable.
setopt CDABLE_VARS

# History
# ---------------------------------------------------------

# Write the history file in the ':start:elapsed;command' format.
setopt EXTENDED_HISTORY

# Append only when writing history.
setopt APPEND_HISTORY

# Write commands to history file as soon as possible.
setopt INC_APPEND_HISTORY

# Share history between all sessions.
setopt SHARE_HISTORY

# Expire a duplicate event first when trimming history.
setopt HIST_EXPIRE_DUPS_FIRST

# Do not record an event that was just recorded again.
setopt HIST_IGNORE_DUPS

# Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_ALL_DUPS

# Do not display a previously found event.
setopt HIST_FIND_NO_DUPS

# Do not record an event starting with a space.
setopt HIST_IGNORE_SPACE

# Do not write a duplicate event to the history file.
setopt HIST_SAVE_NO_DUPS

# Do not execute immediately upon history expansion.
setopt HIST_VERIFY

# Completion
# ---------------------------------------------------------

# Intelligently add a space after variable completion.
setopt AUTO_PARAM_KEYS

 # Intelligently add a slash after directory completion.
setopt AUTO_PARAM_SLASH

# Remove trailing slash if next char is a word delim.
setopt AUTO_REMOVE_SLASH

# Completions happen at the cursor's location.
setopt COMPLETE_IN_WORD

# Tab completion expands globs.
setopt GLOB_COMPLETE

# Ensure the command path is hashed before completion.
setopt HASH_LIST_ALL

# Expand first match and use the interactive menu.
setopt MENU_COMPLETE

# Expansion and Globbing
# ---------------------------------------------------------

# Enable globbing (i.e. the use of the '*' operator).
setopt GLOB

# Use additional glob operators ('#', '~', and '^').
setopt EXTENDED_GLOB

# Require a leading '.' to be matched explicitly.
setopt NO_GLOB_DOTS

# Mark directories resulting from globs with trailing slashes.
setopt MARK_DIRS

# If a glob fails, the command isn't executed.
setopt NOMATCH

# Input/Output
# ---------------------------------------------------------

# Allow '>>' to create a file.
setopt APPEND_CREATE

# Prevent `>` from clobbering files. Use `>!` to clobber.
setopt NO_CLOBBER

# Offer to correct the spelling of commands.
setopt CORRECT

# Allow comments in interactive shells.
setopt INTERACTIVE_COMMENTS

# Enable short loop syntax: `for <var> in <seq>; <command>`.
setopt SHORT_LOOPS

# Job Control
# ---------------------------------------------------------

# When suspended jobs are disowned, resume them in the bg.
setopt AUTO_CONTINUE

# Single-word simple commands are candidates for resumption.
setopt AUTO_RESUME

# Run background jobs at lower priority.
setopt BG_NICE

# Warn about suspended jobs on exit.
setopt CHECK_JOBS

# Warn about background jobs on exit.
setopt CHECK_RUNNING_JOBS

# Scripts and Functions
# ---------------------------------------------------------

# Do not allow `break` etc. outside of loops.
setopt LOCAL_LOOPS

# ZLE
setopt ZLE # Use ZLE.
setopt NO_BEEP # Do not beep on ZLE errors (most beeps).
