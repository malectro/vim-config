--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme OuterSunset]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

--Set statusbar
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'OuterSunset',
    component_separators = '|',
    section_separators = '',
  },
}

--Enable Comment.nvim
require('Comment').setup()

--Remap space as leader key
-- vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ','
vim.g.maplocalleader = ','

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

--Map blankline
require('ibl').setup {
  indent = { char = '┊' },
  exclude = {
    filetypes = { 'help', 'packer' },
    buftypes = { 'terminal', 'nofile' },
  },
}

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- Devicons
require'nvim-web-devicons'.setup {
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    file_ignore_patterns = {
      "node_modules",
      "apps/android",
      "apps/ios"
    },
  },
}

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'

-- Enable telescope file browser
-- require("telescope").load_extension "file_browser"
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>fb",
--   ":Telescope file_browser",
--   { noremap = true }
-- )

--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', [[<cmd>lua require('telescope.builtin').git_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>/', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ee', [[<cmd>lua require('telescope.builtin').diagnostics()<CR>]], { noremap = true, silent = true })

-- Treesitter configuration
-- nvim-treesitter v1.x: highlight and indent are enabled by default.
-- Parsers must be installed manually via :TSInstall

-- Textobject config (lookahead, set_jumps)
require('nvim-treesitter-textobjects').setup {
  select = { lookahead = true },
  move = { set_jumps = true },
}

-- Textobject keymaps (select)
local ts_select = require('nvim-treesitter-textobjects.select')
vim.keymap.set({ 'x', 'o' }, 'af', function() ts_select.select_textobject('@function.outer', 'textobjects') end)
vim.keymap.set({ 'x', 'o' }, 'if', function() ts_select.select_textobject('@function.inner', 'textobjects') end)
vim.keymap.set({ 'x', 'o' }, 'ac', function() ts_select.select_textobject('@class.outer', 'textobjects') end)
vim.keymap.set({ 'x', 'o' }, 'ic', function() ts_select.select_textobject('@class.inner', 'textobjects') end)

-- Textobject keymaps (move)
local ts_move = require('nvim-treesitter-textobjects.move')
vim.keymap.set('n', ']m',  function() ts_move.goto_next_start('@function.outer') end)
vim.keymap.set('n', ']]',  function() ts_move.goto_next_start('@class.outer') end)
vim.keymap.set('n', ']M',  function() ts_move.goto_next_end('@function.outer') end)
vim.keymap.set('n', '][',  function() ts_move.goto_next_end('@class.outer') end)
vim.keymap.set('n', '[m',  function() ts_move.goto_previous_start('@function.outer') end)
vim.keymap.set('n', '[[',  function() ts_move.goto_previous_start('@class.outer') end)
vim.keymap.set('n', '[M',  function() ts_move.goto_previous_end('@function.outer') end)
vim.keymap.set('n', '[]',  function() ts_move.goto_previous_end('@class.outer') end)

-- Diagnostic keymaps
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.jump({count = -1})<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.jump({count = 1})<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>an', '<cmd>lua vim.diagnostic.jump({count = 1, severity = vim.diagnostic.severity.ERROR})<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })

-- LSP settings

-- Keymaps set on attach
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local opts = { remap = false, silent = true, buffer = bufnr }
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { remap = false, silent = true, buffer = bufnr, desc = 'LSP: ' .. desc })
    end

    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.keymap.set('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.keymap.set('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.keymap.set('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.keymap.set('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.keymap.set({'n', 'v'}, '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.keymap.set('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
    vim.keymap.set({'n', 'v'}, '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = false })<CR>', opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
  end,
})

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Apply capabilities to all servers
vim.lsp.config('*', { capabilities = capabilities })

-- Configure servers
vim.lsp.config('denols', {
  root_dir = function(fname) return vim.fs.root(fname, { 'deno.json' }) end,
  init_options = {
    config = "deno.json",
    importMap = "import_map.json",
    lint = true,
  },
})

vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  init_options = {
    hostInfo = "neovim",
    maxTsServerMemory = 8192,
  },
  root_dir = function(fname) return vim.fs.root(fname, { 'tsconfig.json' }) end,
})

vim.lsp.enable({ 'rust_analyzer', 'gopls', 'lua_ls', 'denols', 'ts_ls' })

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
-- vim: ts=2 sts=2 sw=2 et

-- null-ls setup
--[[ require("null-ls").setup {
  sources = {
    require("null-ls").builtins.formatting.prettier.with({
      filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'less', 'json', 'html' },
    }),
    require("null-ls").builtins.diagnostics.eslint,
    require("null-ls").builtins.formatting.black,
    -- require("null-ls").builtins.diagnostics.mypy,
    -- require("null-ls").builtins.formatting.gofmt,
    -- require("null-ls").builtins.formatting.rustfmt,
    -- require("null-ls").builtins.formatting.deno_fmt,
  },
  root_dir = lspconfig.util.root_pattern(".prettierrc"),
} ]]

-- Nvim Tree Setup
-- require("nvim-tree").setup()

-- NeoTree setup
require('neo-tree').setup {
  filesystem = {
    window = {
      mappings = {
        ["<bs>"] = "navigate_up",
        ["U"] = "navigate_up",
				["T"] = "open_tab",
        ["/"] = "noop",
      }
    },
		commands = {
			open_tab = function (state)
				local utils = require('neo-tree.utils')
				local tree = state.tree
  			local node = tree:get_node()
				local path = node:get_id()
				utils.open_file(state, path, 'tabedit') 
			end
		},
  },
}

vim.cmd([[nnoremap \ :Neotree toggle reveal<cr>]])

-- NO longer sure what this does?
-- trying this?
-- vim.cmd([[ command! -nargs=1 Browse silent exec '!open "<args>"' ]])
vim.g.nvim_tree_disable_netrw = 0

-- CodeCampanion
require('codecompanion').setup {
  display = {
    chat = {
      render_headers = false,
    }
  },
  adapters = {
    openai = function()
      return require("codecompanion.adapters").extend("openai", {
        env = {
          api_key = "cmd:op read op://personal/OpenAI/CodeCompanionApiKey --no-newline",
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = "openai",
    },
    inline = {
      adapter = "copilot",
    },
  },
}

vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<LocalLeader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
