# Kyle's NeoVim Config

## To Install

Create or back up `~/.config/nvim`. Then clone the repo.

    mv ~/.config/nvim ~/.config/old-nvim
    git clone git@github.com:qarren/vim-config.git ~/.config/nvim

Install Packer using [these quickstart instructions](https://github.com/wbthomason/packer.nvim).

Telescope needs [rg (aka ripgrep)](https://github.com/BurntSushi/ripgrep) to search the content of text files. 

    brew install ripgrep

Install a nerd font https://www.nerdfonts.com/font-downloads 
(I like Meslo (cmd+f for Menlo).)
A few other fonts are commented out, and you can activate them in the `init.vim`.

Open nvim (ignoring any errors) and run:

    :PackerInstall

After this you'll probably want to repopen neovim and verify that there are no longer
errors. When you start editing a file in a new language, you'll want to install the
TreeSitter stuff for it.

    :TSInstall

After a moment, the highlighting of that language should improve.


## On Packer 

`packer.nvim` is a package manager for neovim. [Read about it here](https://github.com/wbthomason/packer.nvim).


## Important Features

### Telescope

While in a git repo, type `, + p` to begin a fuzzy search on its filenames. Hit `return` to open the file in the current buffer or a new tab. [More on Telescope and its mappings here.](https://github.com/nvim-telescope/telescope.nvim)

### nvim-lsp-config 

NeoVim has built-in support for the Language Server Protocol. `nvim-lsp-config` takes care of setting up and managing the configurations required to communicate with different servers. To add or remove a server config, open `lua/kickstart.lua` and edit the `servers` list. Note that things like `eslint` and `prettier` do not conform to the LSP and require support through something like `null-ls`. [Read more about it here.](https://github.com/neovim/nvim-lspconfig) 

### nvim-treesitter

NeoVim has experimental tree sitter support. This allows navigation of code based on functional groupings (and a lot more). I haven't gone very deep here, but something like `[m` will move your cursor to start of the next function. [Read more about it here.](https://github.com/nvim-treesitter/nvim-treesitter)

### NeoTree

Hit `\\` to view the current directory. Open/close a directory with `return`, enter a directory with `.`, and move up one directory with `U`. `:help` is useful.
