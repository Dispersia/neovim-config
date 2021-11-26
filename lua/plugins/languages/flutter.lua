local lsp_settings = require('plugins.languages.settings')

require('flutter-tools').setup{
  lsp = {
    capabilities = lsp_settings.Capabilities,
    on_attach = lsp_settings.on_attach,
  }
}

