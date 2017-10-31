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

Install
-------

Clone onto your laptop:

    git clone git://github.com/dragan/dotfiles.git $HOME/.dotfiles

1. Install [rcm](https://github.com/thoughtbot/rcm).
2. Install the dotfiles using rcm:

    env RCRC=$HOME/.dotfiles/rcrc rcup

This command will create symlinks for config files in your home directory.
Setting the `RCRC` environment variable tells `rcup` to use standard
configuration options:

* Exclude the `README.md` and `LICENSE` files, which are part of
  the `dotfiles` repository but do not need to be symlinked in.
* Give precedence to personal overrides which by default are placed in
  `~/.dotfiles-local`

You can safely run `rcup` multiple times to update:

    rcup

Thanks
------

Thank you, [thoughtbot][thoughtbot], this repository was heavily inspired
by their project. I liked their organization and installation method. The only
reason I didn't fork is due to not being a Ruby developer.

[thoughtbot]: https://github.com/thoughtbot/dotfiles

License
-------

Released under the [MIT License][mit-license]. See [LICENSE][license] for more information.

[mit-license]: http://www.opensource.org/licenses/mit-license.php
[license]: https://github.com/dragan/dotfiles/blob/master/LICENSE
