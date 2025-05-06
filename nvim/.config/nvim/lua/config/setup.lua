vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
-- allows you to undo even if you close the file then reopen 
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.splitright = true
vim.opt.splitbelow = true

-- makes lsp and events a bit faster
vim.opt.updatetime = 50

-- so you can copy and paste between nvim and other apps
vim.opt.clipboard:append("unnamedplus")

-- allows mouse support for all modes including clicking, selecting...
vim.opt.mouse = "a"

-- allows consistent coding styles accross editors
vim.g.editorconfig = true
