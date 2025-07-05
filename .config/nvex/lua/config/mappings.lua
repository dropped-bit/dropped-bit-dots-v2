--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Better buffer navigation
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>jk", ":bdelete<CR>", { desc = "Delete buffer" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent right", noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { desc = "Indent left", noremap = true, silent = true })

-- source on the fly
-- vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- better yanking ;)
vim.keymap.set("v", "<leader>yp", ":'<,'>y+<CR>", { desc = "[Y]ank to [P]lus" })

-- use jk to exist insert mode
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
