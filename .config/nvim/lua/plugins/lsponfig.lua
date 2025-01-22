local nvim_lsp = require("lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        denols = {
          filetypes = { "typescript", "typescriptreact" },
          root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
        },
        ts_ls = {
          root_dir = nvim_lsp.util.root_pattern("package.json"),
          single_file_support = false,
        },
      },
    },
  },
}
