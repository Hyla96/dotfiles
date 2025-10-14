return {
  "nvim-flutter/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
    "mfussenegger/nvim-dap", -- Required for debugging
  },

  decorations = {
    app_version = true,
    device = true,
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
  },
}
