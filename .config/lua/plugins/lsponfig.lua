return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Global LSP settings
      setup = {
        -- Add global setup function to handle sync issues
        ["*"] = function(server, opts)
          -- Force full document sync for all servers to prevent sync issues
          if opts.capabilities then
            opts.capabilities.textDocument = opts.capabilities.textDocument or {}
            opts.capabilities.textDocument.synchronization = {
              dynamicRegistration = false,
              willSave = false,
              willSaveWaitUntil = false,
              didSave = false,
            }
          end
        end,
      },
      servers = {
        pylsp = false, -- Disable pylsp since we're using basedpyright
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                autoImportCompletions = true,
                diagnosticSeverityOverrides = {
                  reportUnusedImport = "information",
                  reportUnusedFunction = "information",
                  reportUnusedVariable = "information",
                },
              },
            },
          },
        },
        eslint = {
          capabilities = {
            workspace = {
              didChangeWorkspaceFolders = {
                dynamicRegistration = false,
              },
            },
          },
          settings = {
            workingDirectories = { mode = "auto" },
          },
        },
        vtsls = {
          single_file_support = true,
          settings = {
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = "none" },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
              },
            },
            javascript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = "none" },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
              },
            },
          },
        },
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
              cargo = {
                allFeatures = true,
              },
              procMacro = {
                enable = true,
              },
            },
          },
        },
        yamlls = {
          capabilities = {
            workspace = {
              configuration = {
                dynamicRegistration = false,
              },
            },
          },
        },
        taplo = {
          capabilities = {
            workspace = {
              fileOperations = {
                willRename = false,
                didRename = false,
              },
            },
          },
        },
      },
    },
  },
}
