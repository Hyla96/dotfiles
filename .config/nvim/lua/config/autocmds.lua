-- Safe colorscheme setup with fallback
local function setup_colors()
  local ok, catppuccin_palettes = pcall(require, "catppuccin.palettes")
  if ok and catppuccin_palettes.get_palette then
    local colors = catppuccin_palettes.get_palette()
    vim.api.nvim_set_hl(0, "LineNr", { fg = colors.overlay2 })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.green })
  else
    -- Fallback colors if catppuccin is not available
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#6c7086" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#a6e3a1" })
  end
end

-- Defer color setup until after colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("CustomColors", { clear = true }),
  callback = setup_colors,
})

-- Also set on VimEnter as fallback
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("CustomColorsInit", { clear = true }),
  callback = setup_colors,
})

-- Fix for LSP sync issues with formatting
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspSyncFix", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client then
      -- Disable incremental sync for problematic servers
      client.config.flags = client.config.flags or {}
      client.config.flags.debounce_text_changes = 150
    end
  end,
})

-- Separate autocmd for formatting sync without pattern+buffer conflict
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("FormatSyncFix", { clear = true }),
  callback = function(args)
    -- Force full sync before formatting
    local clients = vim.lsp.get_clients({ bufnr = args.buf })
    for _, client in ipairs(clients) do
      if client.server_capabilities.documentFormattingProvider then
        vim.lsp.buf_request_sync(args.buf, "textDocument/didChange", {
          textDocument = {
            uri = vim.uri_from_bufnr(args.buf),
            version = vim.lsp.util.buf_versions[args.buf] or 0,
          },
          contentChanges = {
            {
              text = table.concat(vim.api.nvim_buf_get_lines(args.buf, 0, -1, false), "\n"),
            },
          },
        }, 1000)
        break
      end
    end
  end,
})

-- Auto-format JSON files on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("JsonAutoformat", { clear = true }),
  pattern = "*.json",
  callback = function(args)
    local buf_content = table.concat(vim.api.nvim_buf_get_lines(args.buf, 0, -1, false), "\n")
    local temp_file = vim.fn.tempname()

    -- Write buffer content to temp file
    local file = io.open(temp_file, "w")
    if file then
      file:write(buf_content)
      file:close()

      -- Use jq to format if available, otherwise use python
      local cmd = vim.fn.executable("jq") == 1
        and string.format("jq '.' %s", vim.fn.shellescape(temp_file))
        or string.format("python3 -m json.tool %s", vim.fn.shellescape(temp_file))

      local handle = io.popen(cmd .. " 2>&1")
      if handle then
        local formatted = handle:read("*a")
        local success = handle:close()

        if success and formatted and formatted ~= "" then
          local lines = vim.split(formatted, "\n", { plain = true })
          -- Remove trailing empty line if present
          if lines[#lines] == "" then
            table.remove(lines)
          end
          vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, lines)
        end
      end

      -- Clean up temp file
      os.remove(temp_file)
    end
  end,
})

-- Auto-format Flutter/Dart files on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("FlutterAutoformat", { clear = true }),
  pattern = "*.dart",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
