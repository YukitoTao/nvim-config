require('notify')(
  "Setting Language Server Protocol for Javascript project...\n\nPlease install following packages:\n  npm i -g vscode-langservers-extracted stylelint-lsp typescript typescript-language-server\n\nIgnore this message if those packages already installed.",
  "info"
)
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require('lspconfig').html.setup {
  capabilities = capabilities,
}
require('lspconfig').stylelint_lsp.setup{
  capabilities = capabilities,
}
require('lspconfig').tsserver.setup{
  capabilities = capabilities,
}

