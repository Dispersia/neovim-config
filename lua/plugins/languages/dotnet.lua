local nvim_lsp = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

nvim_lsp.omnisharp.setup {
  capabilities = capabilities,
  on_attach = lsp_settings.on_attach,
  cmd = { "/home/dispersia/programs/omnisharp-server/run", "--languageserver", "--hostPID", tostring(pid) },
}

