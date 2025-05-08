vim.g.mapleader = " "

vim.opt.guicursor = ""
-- Lets you paste whatever you have in your global clipboard with "P"
-- vim.opt.clipboard = "unnamedplus"


vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})


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
