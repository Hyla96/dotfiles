return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "catppuccin/nvim" },
    opts = function()
      local ok, catppuccin_bufferline = pcall(require, "catppuccin.groups.integrations.bufferline")
      local highlights = {}
      
      if ok and catppuccin_bufferline.get then
        highlights = catppuccin_bufferline.get()
      end
      
      return {
        highlights = highlights,
        options = {
          theme_overrides = {
            normal = {
              fg = "#c9cbff",
              bg = "#1e1e2e",
            },
          },
        },
      }
    end,
  },
}