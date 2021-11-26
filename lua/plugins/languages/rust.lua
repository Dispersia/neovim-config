local nvim_lsp = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

require('rust-tools').setup({
  tools = {
    autoSetHints = true,
    hover_with_actions = true,
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hitns_prefix = "",
      other_hints_prefix = "",
    },
  },
  server = {
    capabilities = lsp_settings.Capabilities,
    on_attach = lsp_settings.on_attach,
    flags = {
      debounce_text_changes = 250,
    },
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importPrefix = "by_self",
        },
        cargo = {
          loadOutDirsFromCheck = true,
        },
        checkOnSave = {
          command = "clippy",
        },
        procMacro = {
          enable = true
        },
      },
    },
  }
})

