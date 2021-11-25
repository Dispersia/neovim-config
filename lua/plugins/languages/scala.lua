local metals_config = require('metals').bare_config()

local lsp_settings = require('plugins.languages.settings')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

metals_config.settings = {
    showImplicitArguments = true,
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

metals_config.capabilities = capabilities
metals_config.on_attach = lsp_settings.on_attach
metals_config.init_options.statusBarProvider = "on"

vim.api.nvim_exec(
  [[
  augroup MetalsInitialize
    autocmd!
    autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)
    autocmd FileType scala,sbt nnoremap <silent> <buffer> <C-T> :!sbt test<CR>
    autocmd FileType scala,sbt nnoremap <silent> <buffer> <C-R> :!sbt run<CR>
  augroup end
  ]],
  false
)

