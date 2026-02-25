return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- existing keymap
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      -- new keymap for dynamically selecting a subpath
      {
        "<leader>fs",
        function()
          vim.ui.input({ prompt = "Enter subpath: " }, function(subpath)
            if subpath and subpath ~= "" then
              require("telescope.builtin").live_grep({ search_dirs = { subpath } })
            else
              print("No subpath provided.")
            end
          end)
        end,
        desc = "Live Grep in a Dynamic Subpath",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--ignore-file",
          ".gitignore",
        },
      },
    },
  },
}
