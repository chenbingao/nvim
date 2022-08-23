vim.cmd [[
set guifont=SFMono\ Nerd\ Font:h16
]]
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.cursorcolumn = true
vim.wo.signcolumn = "yes"
vim.wo.colorcolumn = "80"
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
vim.o.ignorecase = false
-- vim.o.smartcase = false
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.showmode = false
vim.o.cmdheight = 2
vim.o.autoread = true
vim.bo.autoread = true
vim.o.wrap = false
vim.wo.wrap = false
vim.o.whichwrap = "b,s,<,>,[,]"
vim.o.hidden = true
-- vim.o.mouse = 'a'
-- vim.o.backup = false
-- vim.o.writebackup = false
-- vim.o.swapfile = false
vim.o.updatetime = 300
vim.o.timeoutlen = 300
vim.o.splitbelow = true
vim.o.splitright = true
vim.g.completeopt = "menu,menuone,noselect,noinsert"
vim.o.termguicolors = true
vim.opt.termguicolors = true
vim.o.list = true
-- vim.o.listchars = 'space:.'
vim.o.listchars = "space: "
vim.o.wildmenu = true
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.pumheight = 10
vim.o.showtabline = 2
-- vim.g.python3_host_prog = "/opt/homebrew/bin/python3"

local prefix = vim.fn.expand "/tmp"
vim.opt.undodir = { prefix .. "/nvim/.undo//" }
vim.opt.backupdir = { prefix .. "/nvim/.backup//" }
vim.opt.directory = { prefix .. "/nvim/.swp//" }

vim.o.clipboard = "unnamed,unnamedplus"
vim.cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = true}"