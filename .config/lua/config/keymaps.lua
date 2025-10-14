-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<leader><tab>a", ":tabnew | Alpha<CR>", { desc = "New Tab with Homepage" })

-- Swap LazyGit keymaps: gg opens in cwd, gG opens in root
vim.keymap.set("n", "<leader>gg", function() require("snacks").lazygit() end, { desc = "Lazygit (cwd)" })
vim.keymap.set("n", "<leader>gG", function() 
  local LazyVim = require("lazyvim")
  require("snacks").lazygit({ cwd = LazyVim.root.git() }) 
end, { desc = "Lazygit (Root Dir)" })

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

vim.keymap.set("n", "<F5>", ':lua require("dap").continue()<CR>')
vim.keymap.set("n", "<F10>", ':lua require("dap").step_over()<CR>')
vim.keymap.set("n", "<F11>", ':lua require("dap").step_into()<CR>')
vim.keymap.set("n", "<F12>", ':lua require("dap").step_out()<CR>')
vim.keymap.set("n", "<Leader>db", ':lua require("dap").toggle_breakpoint()<CR>')
vim.keymap.set("n", "<Leader>dB", ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
vim.keymap.set("n", "<Leader>dr", ':lua require("dap").repl.open()<CR>')
