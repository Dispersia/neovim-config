local nvim_lsp = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

require('rust-tools').setup({
  tools = {
    autoSetHints = true,
    hover_with_actions = true,
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  server = {
    capabilities = lsp_settings.Capabilities,
    on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

      local opts = { noremap = true, silent = true }

      buf_set_keymap('n', '<leader>ct', ':!cargo test<CR>', opts)
      buf_set_keymap('n', '<leader>cb', ':!cargo build<CR>', opts)
      buf_set_keymap('n', '<leader>cr', ':!cargo run<CR>', opts)
      buf_set_keymap('n', '<leader>cf', ':!cargo fmt<CR>', opts)

      lsp_settings.on_attach(client, bufnr)
    end,
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
        diagnostics = {
          disabled = { "unresolved-proc-macro" }
        },
      },
    },
  }
})

