" TODO
" float color
" trouble?

" Load Packer plugins
lua require('plugins')
lua require('kickstart')

" Load nvim-lsp configs
" lua require('lsp')


"
" Behavior Configuration
" ----------------------

set tabstop=2                   " Tab settings
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent

set autoread                    " No prompt for file changes outside Vim
set noswapfile                  " No swap file
set nobackup                    " No backup file
set nowritebackup

let g:rust_recommended_style=0  " prevents default tabstop of 4 in Rust

"
" Mappings
" --------

" Special key for prefixing helpful commands
let mapleader = ","

" Reload .vimrc
map <leader>rv  :source ~/.config/nvim/init.vim<CR>

" Change directory to current file
map <Leader>cd :lcd %:p:h<CR>

" Go back in the jump list
map gb <C-o><CR>

" Indent/unindent visual mode selection
vmap <tab>      >gv
vmap <S-tab>    <gv

" make ctrl+c work 
" set clipboard=unnamed
" set clipboard+=unnamedplus
" vnoremap <C-c>  "+y
vnoremap <C-c> "*y

" colorscheme molokai
colorscheme OuterSunset
if has('termguicolors')
  set t_Co=256
  set termguicolors
  " colorscheme OceanicNext
  " colorscheme ayu
  " colorscheme onedark
  " let g:onedark_terminal_italics = 1
  " colorscheme gruvbox
  " let g:gruvbox_contrast_dark = 'hard'
  " colorscheme dracula
endif

set background=dark
if exists('+guifont')
  " set guifont=Operator\ Mono:h16
  " set guifont=Fira\ Code:h16
  " set guifont=Space\ Mono:h14
  " set guifont=SpaceMono\ Nerd\ Font:h14
  set guifont=Monaco:h14
endif
