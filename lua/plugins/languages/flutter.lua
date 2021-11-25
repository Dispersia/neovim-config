local lsp_settings = require('plugins.languages.settings')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require('flutter-tools').setup{
  lsp = {
    capabilities = capabilities,
    on_attach = lsp_settings.on_attach,
  }
}

