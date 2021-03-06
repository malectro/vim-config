# Kyle's Vim Config

## To Install

(Re)move `~/.vim` and `~/.vimrc` if you have them already, and run:

    git clone git@github.com:qarren/vim-config.git ~/.vim
    cd ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc

CtrlP is set to use either [rg (aka ripgrep)](https://github.com/BurntSushi/ripgrep) or [ag (aka The Silver Searcher)](https://github.com/ggreer/the_silver_searcher). Install them with:

    brew install ripgrep
    brew install the_silver_searcher

Install optional Space Mono font https://fonts.google.com/specimen/Space+Mono
A few other fonts are commented out, and you can activate them in the `vimrc`. Fira Code is particularly nice but costs money.

Open vim (ignoring any errors) and run:

    :PlugInstall


## On vim-plug

`vim-plug` is a package manager for vim. [Read about it here](https://github.com/junegunn/vim-plug).


## Important Features

### CtrlP and rg

While in a git repo, type `, + p` to begin a fuzzy search on its filenames. Hit `return` or `T` to open the file in the current buffer or a new tab.

### NERDTree

Hit `\\` to view the current directory. Open/close a directory with `return`, enter a directory with `C`, and move up one directory with `u`. `:help` is useful.

### ale

ale is the spiritual successor to syntastic. You should be able to get it to run almost any linter.
