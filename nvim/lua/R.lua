require('notify')(
  "Setting Language Server Protocol for R project...\n\nPlease install following packages:\n  install.packages('languageserver')\n\nIgnore this message if those packages already installed.",
  "info"
)

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)


require('lspconfig').r_language_server.setup{
  capabilities = capabilities,
}
