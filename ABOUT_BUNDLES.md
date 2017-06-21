# About Bundles


## Bundles Used

### `ack.vim`
Allows use of `ack` (a text searcher) in `vim`.

I don't use this much, but it's very common in vim workflows. Possible I'll learn it later.

### `ale`
Successor to Syntastic. Allows asyncronous linting while you code.

Currently I only get mileage out of this when writing JavaScript.

### CtrlP
Successor to CommandT. Allows fuzzy finding of files and tags.

I'm getting a lot of mileage out of this, but am not sure if it's much better than vanilla VIM finding/searching. Will evaluate.

### NERDCommenter
Allows smart commenting of lines using macros.

See ~/.vimrc for mapped keys.

### NERDTree
Allows viewing of the current path as a directory tree.

Very important to me.

### `vim-fugitive`
Git integration for vim.

I'm only keeping this for `:Gblame`, which allows you to view a git blame of the current file.

### `vim-flake8`
Allows for Flake8 Python linting in vim.

Need to find a way of adding this to `ale`.

### `vim-javascript`
Better JavaScript syntax highlighting.

### `vim-jsbeautify`
Autoformatting of JS and JSON files.

I probably don't need this.

### `vim-jsx`
JSX syntax highlighting.

### `vim-org-vim-l9-1.1`
Seemingly important vimscript library.

### `vim-surround`
Allows changing of surrounding characters using `cs<char><tochar>`.


## Bundles Removed But Possibly Useful

### `autoclose`
Automatically creates a closing character for characters that could be opening a block or string.

I found this to hinder my ability to write code quickly, but might add it back later.
