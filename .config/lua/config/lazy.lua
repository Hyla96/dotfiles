local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        colorscheme = "catppuccin",
      },
    },
    -- Configure conform with async
    {
      "stevearc/conform.nvim",
      opts = {
        timeout = 10000,
        async = false, -- Disable async to prevent sync issues
        format_on_save = function(bufnr)
          -- Disable autoformat for files where LSP has sync issues
          local disable_filetypes = { c = true, cpp = true }
          if disable_filetypes[vim.bo[bufnr].filetype] then
            return
          end
          return { timeout_ms = 500, lsp_fallback = true }
        end,
        formatters_by_ft = {
          dart = { "dart_format" }, -- Add this line
          lua = { "stylua" },
          fish = { "fish_indent" },
          sh = { "shfmt" },
          python = { "ruff_format", "ruff_fix" },
          typescript = { "prettier" },
          javascript = { "prettier" },
          rust = { "rustfmt" },
        },
        formatters = {
          dart_format = {
            command = "dart",
            args = { "format", "--line-length=120" },
          },
          ruff_fix = {
            command = "ruff",
            args = { "check", "--fix", "--stdin-filename", "$FILENAME", "-" },
            stdin = true,
          },
        },
      },
    },
    {
      "mfussenegger/nvim-lint",
      opts = {
        linters_by_ft = {
          python = { "ruff" },
        },
      },
    },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  install = { colorscheme = { "catppuccin" } },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
