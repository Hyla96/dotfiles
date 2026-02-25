return {
  -- Disable LazyVim's default VenvSelect to avoid branch warning
  {
    "linux-cultist/venv-selector.nvim",
    enabled = false, -- Completely disable to avoid branch conflicts
  },
  -- Explicitly disable pylsp in Python extra
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = false, -- Explicitly disable pylsp
      },
    },
  },
}