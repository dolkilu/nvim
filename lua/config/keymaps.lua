-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Explorer" })
vim.keymap.set("i", "<C-Del>", "<C-o>de", { desc = "Delete after cursor" })

vim.keymap.set("v", "A-Up", ":m '>+1<CR>gv=gv", { desc = "Code up" })
vim.keymap.set("v", "A-Down", ":m '<-2<CR>gv=gv", { desc = "Code down" })
vim.keymap.set("v", "A-e", ":m '>+1<CR>gv=gv", { desc = "Code up" })
vim.keymap.set("v", "A-n", ":m '<-2<CR>gv=gv", { desc = "Code down" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Freeze cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Center search" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center search" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Better paste" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to blackhole" })

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>xc", "<cmd>!chmod +x %<CR>", { silent = true })
