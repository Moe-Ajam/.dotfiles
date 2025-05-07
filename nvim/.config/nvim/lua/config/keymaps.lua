local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move a line up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection"} )
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection"} )


-- Move the line below it up
vim.keymap.set("n", "J", "mzJ`z")

-- Navigate the file up and down fast
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Centers the cursor properly when going through search results with "n"
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- leader d delete wont remember as yanked/clipboard when delete pasting
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<ESC>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- Unmaps Q in normal mode because its annoying
vim.keymap.set("n", "Q", "<nop>")

-- prevent x delete from registering when next paste
vim.keymap.set("n", "x", '"_x', opts)

-- Replace the word cursor is on globally
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word cursor is on globally" })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

--split management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window


-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    })
end, { desc = "Toggle LSP diagnostics" })
