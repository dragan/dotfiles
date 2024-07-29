# ragan does dotfiles

<!--toc:start-->

- [ragan does dotfiles](#ragan-does-dotfiles)
  - [dotfiles](#dotfiles)
  - [Requirements](#requirements)
  - [Install](#install)
  - [Terminal Theme](#terminal-theme)
  - [Tmux Plugins](#tmux-plugins)
  - [Vim Plugins](#vim-plugins)
  - [Thanks](#thanks)
  - [License](#license)
  <!--toc:end-->

## dotfiles

Your dotfiles are how you personalize your system. These are my dotfiles. There
are many like them, but these are mine.

## Requirements

Set zsh as your login shell:

    chsh -s $(which zsh)

Close your terminal and launch again, if `zsh` indicates that a zshrc file is
missing, just press `q`.

## Install

Verify the following are installed for your OS `command -v [command]`:

1. [git][git]
2. [chezmoi][chezmoi]

[git]: https://git-scm.com/
[chezmoi]: https://github.com/twpayne/chezmoi/

Install the dotfiles using chezmoi:

    chezmoi init --apply dragan/dotfiles

This command will clone, initialize, and create your config files in your home directory.

- Excludes the `README.md` and `LICENSE` files, which are part of
  the `dotfiles` repository but do not need to be applied to our HOME directory.

You can also easily remove your dotfiles by running:

TODO: Document cleaning up and resetting

## Terminal Theme

I use [Catppuccin Mocha][catppuccin] to set my terminal theme and it is used across
the integrated terminal user interfaces where available.

[catppuccin]: https://catppuccin.com/

## Tmux Plugins

Inside tmux, I use the [Tmux Plugin Manager (tpm)][tpm] to install and manage
additional plugins.

[tpm]: https://github.com/tmux-plugins/tpm

## Vim Plugins

NeoVim plugins are managed with [lazy.nvim][lazy] underneath the [LazyVim][lazyvim]
base configuration. LazyVim is a NeoVim setup powered by lazy.nvim
to make it easy to customize and extend the configuration.

[lazy]: https://lazy.folke.io/
[lazyvim]: https://www.lazyvim.org/

## Thanks

Thank you, [thoughtbot][thoughtbot], this repository was heavily inspired
by their project. I liked their organization and installation method. The only
reason I didn't fork is due to not being a Ruby developer.

[thoughtbot]: https://github.com/thoughtbot/dotfiles

## License

Released under the [MIT License][mit-license]. See [LICENSE][license] for more
information.

[mit-license]: http://www.opensource.org/licenses/mit-license.php
[license]: https://github.com/dragan/dotfiles/blob/master/LICENSE
