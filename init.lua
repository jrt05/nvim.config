

--vim.cmd.source("~/.vimrc")

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--require("config.lazy")
--require("lazy").setup({ { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" } })
--require("config.treesitter") -- Treesitter configuration
--require("config.lsp") -- LSP configuration

-- Set up line numbers
vim.opt.number = true
-- Make them relative to the current position
vim.opt.relativenumber = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Set up undo file
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Set shortcut for Explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Preview substitutions live, as you type!
-- Not sure what this does.
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8

-- Set my tab mappings
vim.keymap.set('n', '<F8>', ':tabn<CR>', { desc = 'Tab Next'})
vim.keymap.set('n', '<F7>', ':tabp<CR>', { desc = 'Tab Prev'})
vim.keymap.set('n', '<F2>', ':Tex<CR>', { desc = 'Tab Explorer'})
vim.keymap.set('n', '<F3>', ':Vex<CR>', { desc = 'Vertical Explorer'})
vim.keymap.set('n', '<F4>', ':Sex<CR>', { desc = 'Horizontal Explorer'})

-- Set up tabs to 4 spaces and auto indent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

-- Set incremental search
vim.opt.incsearch = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.opt.hlsearch = false
--vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Remember last position
vim.cmd[[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
--if has("autocmd")
--  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
--endif

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

require("config.lazy")
require("lazy").setup({ { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" } })
require("config.treesitter") -- Treesitter configuration
require("config.lsp") -- LSP configuration

vim.cmd[[colorscheme tokyonight]]     -- Set colorscheme loaded by Lazy
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)  -- Set key used by undotree



