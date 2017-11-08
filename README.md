ragan does dotfiles
===================

dotfiles
--------

Your dotfiles are how you personalize your system. These are my dotfiles. There
are many like them, but these are mine.

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
$ git clone git://github.com/dragan/dotfiles.git $HOME/.dotfiles
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

I use [base16-shell][base16-shell] to set my terminal theme and sometimes my
preference on theme varies. Therefore, after you run rcup and relaunch your
terminal, you will need to set your theme. You will only have to do this once.

The maintainers of base16 have put together a [nice page][base16] to view the
different themes.

To set a theme, in your new terminal, start typing `base16` followed by a tab
to perform tab completion. You should be greeted with quite a few `base16_`
options. For instance, if I wanted to set my theme to `default-dark`, I would
type:

```
$ base16_default-dark
```

The result of the command will create three things:

1. `.base16_theme` file in your `$HOME` directory
2. `BASE16_THEME` environment variable
3. `.vimrc_background` for using within vim to set the theme

[base16-shell]: https://github.com/chriskempson/base16-shell
[base16]: https://chriskempson.github.io/base16/

Tmux Plugins
------------

Inside tmux, I use the [Tmux Plugin Manager (tpm)][tpm] to install and manage
additional plugins. To install them, launch tmux and then use the following key
combo:

```
Ctrl + s
Shift + i
```

[tpm]: https://github.com/tmux-plugins/tpm

Vim Plugins
-----------

Vim plugins are managed with [Plug][plug].

[plug]: https://github.com/junegunn/vim-plug

Thanks
------

Thank you, [thoughtbot][thoughtbot], this repository was heavily inspired
by their project. I liked their organization and installation method. The only
reason I didn't fork is due to not being a Ruby developer.

[thoughtbot]: https://github.com/thoughtbot/dotfiles

License
-------

Released under the [MIT License][mit-license]. See [LICENSE][license] for more
information.

[mit-license]: http://www.opensource.org/licenses/mit-license.php
[license]: https://github.com/dragan/dotfiles/blob/master/LICENSE
