vim.g.leader = " "

vim.keymap.set("n", "<leader>u", ":update<CR>:source<CR>")

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("v", "<leader>yy", '"+yy<CR>')

vim.keymap.set("n", "<leader>x", vim.cmd.bd)
