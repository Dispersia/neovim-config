local nvim_lsp = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.cssls.setup {
  capabilities = capabilities,
  on_attach = lsp_settings.on_attach,
}

