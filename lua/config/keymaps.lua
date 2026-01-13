vim.g.mapleader = " "

local keymap = vim.keymap.set

-- Save/Quit
keymap("n", "<leader>w", ":w<CR>")
keymap("n", "<leader>q", ":q<CR>")

-- File tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>")
keymap("n", "<leader>fg", ":Telescope live_grep<CR>")

