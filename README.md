Nick's Dotfiles
===================


Requirements
------------

Set zsh as your login shell:

    chsh -s $(which zsh)

Close your terminal and launch again, if `zsh` indicates that a zshrc file is
missing, just press `q`.


Install
-------

Verify the following are installed for your OS `command -v [command]`:

1. [git][git]
2. [rcm][rcm]
3. [tmux][tmux]
4. [neovim][neovim]
5. [ag][ag]
6. [tig][tig]

[git]: https://git-scm.com/
[rcm]: https://github.com/thoughtbot/rcm/
[tmux]: https://github.com/tmux/tmux/
[neovim]: https://neovim.io/
[ag]: https://geoff.greer.fm/ag/
[tig]: https://jonas.github.io/tig/

Once you've verfied the above are installed, clone this repository to your
machine:

```
$ git clone git@github.com:ncronquist/dotfiles.git $HOME/.dotfiles
```

Install the dotfiles using rcup which is a part of rcm:

```
$ RCRC=$HOME/.dotfiles/rcrc rcup -v
```

This command will create symlinks for config files in your home directory.
Setting the `RCRC` environment variable tells `rcup` to use standard
configuration options:

* Exclude the `README.md` and `LICENSE` files, which are part of
  the `dotfiles` repository but do not need to be symlinked in.
* Give precedence to personal overrides which by default are placed in
  `~/.dotfiles-local`

You can safely run `rcup` multiple times to update:

```
$ rcup -v
```

You can also easily remove your dotfiles by running:

```
$ rcdn -v
```


Terminal Theme
--------------

I use [nova][nova] to set my terminal theme. The first time you run `rcup` and relaunch your terminal, you will need to set your theme. You will only have to do this once.

To set the theme in iTerm:

1. In iTerm, open your preferences
2. Tap on "Profiles" > "Colors" > "Color Presets" > "Import"
3. Select the "$HOME/.iterm/themes/nova.itermcolors" which was downloaded in the [pre-up](./hooks/pre-up) hook script.

[nova]: https://trevordmiller.com/projects/nova


Tmux Plugins
------------

Inside tmux, I use the [Tmux Plugin Manager (tpm)][tpm] to install and manage
additional plugins. To install them, launch tmux and then use the following key
combo:

```
Ctrl + Space
Shift + i
```

[tpm]: https://github.com/tmux-plugins/tpm


Vim Plugins
-----------

Vim plugins are managed with [Plug][plug].

[plug]: https://github.com/junegunn/vim-plug


Thanks
------

This dotfiles repo was originally forked from [@dragan](@dragan) and has 
been tweaked for my particular preferences.

[@dragan]: https://github.com/dragan/dotfiles

License
-------

Released under the [MIT License][mit-license]. See [LICENSE][license] for more
information.

[mit-license]: http://www.opensource.org/licenses/mit-license.php
[license]: https://github.com/ncronquist/dotfiles/blob/master/LICENSE
