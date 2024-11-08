-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim
require("lazy").setup({
  spec = {
    'tpope/vim-fugitive', -- Git commands in nvim
    'tpope/vim-rhubarb', -- Fugitive-companion for github
    'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
    'nvim-tree/nvim-web-devicons',
    -- UI to select things (files, grep, open buffers, etc...)
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' } },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- 'mjlbach/onedark.nvim', -- Theme inspired by Atom

    'nvim-lualine/lualine.nvim', -- Fancier statusline
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Add git related info in the signs columns and popups
    { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    'nvim-treesitter/nvim-treesitter',
    -- Additional textobjects for treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip', -- Snippets plugin
    { name = 'OuterSunset', dir = '~/Projects/outer-sunset' },

    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      -- config = function()
      --   require("typescript-tools").setup {}
      -- end,
    },

    {
      'jose-elias-alvarez/null-ls.nvim',
      dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
      'nvim-tree/nvim-tree.lua',
      dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
    },

    {
      "nvim-neo-tree/neo-tree.nvim",
      version = "v3.x",
      dependencies = { 
        "nvim-lua/plenary.nvim",
        -- enabling this requires a patched font
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim" 
      },
    },

    {
      "andymass/vim-matchup",  
      init = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end,
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "OuterSunset" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
