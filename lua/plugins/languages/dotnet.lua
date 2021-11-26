local nvim_lsp = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

nvim_lsp.omnisharp.setup {
  capabilities = lsp_settings.Capabilities,
  on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', '<space>R', '<cmd>dotnet run<CR>', opts)

    lsp_settings.on_attach(client, bufnr)
  end,
  cmd = { "/home/dispersia/programs/omnisharp-server/run", "--languageserver", "--hostPID", tostring(pid) },
}

