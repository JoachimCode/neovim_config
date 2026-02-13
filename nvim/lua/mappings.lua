require "nvchad.mappings"

-- add yours here
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])


local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


