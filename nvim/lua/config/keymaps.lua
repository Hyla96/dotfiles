-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<leader><tab>a", ":tabnew | Alpha<CR>", { desc = "New Tab with Homepage" })

vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { silent = true, desc = "Open LazyGit" })

-- vim.keymap.set("n", "<C-r>", ":normal! U<CR>", { noremap = true, silent = true, desc = "Undo an undo" })

vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume Telescope" }
)

vim.keymap.set("n", "<C-h>", "<C-w><", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-j>", "<C-w>-", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-k>", "<C-w>+", { desc = "Increase window height" })

vim.keymap.set("v", "<leader>O", ":sort!<CR>", { desc = "Sort lines desc" })
vim.keymap.set("v", "<leader>o", ":sort<CR>", { desc = "Sort lines asc" })
