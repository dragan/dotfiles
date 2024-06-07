#!/usr/bin/env zsh

# Set the GPG_TTY to be the same as the TTY, either via the env var
# or via the tty command.
if [ -n "$TTY" ]; then
  export GPG_TTY="$(tty)"
else
  export GPG_TTY="$TTY"
fi
