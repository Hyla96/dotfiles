return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 200,
        keymap = {
          accept = "<Tab>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = true },
      server_opts_overrides = {
        trace = "off",
        settings = {
          advanced = {
            listCount = 10,
            inlineSuggestCount = 3,
          }
        }
      }
    },
  },
}
