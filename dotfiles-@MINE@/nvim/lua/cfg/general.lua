local g = vim.g
local o = vim.o
local opt = vim.opt

o.nocompatible = true

vim.cmd [[ filetype plugin indent on ]]

-- map <leader> to space
g.mapleader = " "
g.maplocalleader = " "

o.termguicolors = true
o.background = 'dark'
o.autochdir = true

-- show tabline even if we only have 1 file open
o.showtabline = 2

-- stop newline comment from happening
-- this doesn't work: o.formatoptions -= cro
--o.formatoptions = o.formatoptions:gsub('c', '')
--o.formatoptions = o.formatoptions:gsub('r', '')
--o.formatoptions = o.formatoptions:gsub('o', '')
vim.cmd [[autocmd FileType * set formatoptions-=cro ]]
-- for yaml, set the indent to 4 spaces
vim.cmd [[autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab ]]

-- format rust code on save
g.rustfmt_autosave = 1

-- do not save when switching buffers
-- o.hidden = true

-- decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- better editor UI
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true

-- better editing experience
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 3
o.shiftwidth = 3
o.softtabstop = -1 -- if negative, shiftwidth value is used
o.list = true
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- case insensitive searching
o.ignorecase = true
o.smartcase = true

-- tenths of a second to blink when matching brackets
o.mat=2
o.showmatch = true

-- undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
o.nowb = true
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- better buffer splitting
o.splitright = true
o.splitbelow = true

-- no sounds on error
o.noerrorbells = true
o.novisualbell = true
--o.t_vb =
o.tm = 500

o.syntax = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout=600 })
  end,
  group = highlight_group,
  pattern = '*',
})

-- set the location of the cursor to last known position of file when it was closed
vim.cmd [[
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
]]

-- zig
-- Set completeopt to have a better completion experience
--vim.cmd [[set completeopt=menuone,noinsert,noselect]]
-- Enable completions as you type
g.completion_enable_auto_popup = 1
