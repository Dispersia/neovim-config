local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lspconfig.tsserver.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    local ts_utils = require('nvim-lsp-ts-utils')

    ts_utils.setup({})
    ts_utils.setup_client(client)
  end,
})

local null_ls = require('null-ls')
null_ls.config({
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.formatting.prettier
  },
})

require('lspconfig')['null-ls'].setup({})
