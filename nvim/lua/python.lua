-- Notify message manager
require('notify')(
  "Setting Language Server Protocol for Python project...\n\nPlease install following package:\n  pip install 'python-lsp-server[all]'\n\nIgnore above message if package(s) already installed.",
  "info"
)

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Language server protocol
require('lspconfig').pylsp.setup{
  capabilities = capabilities,
}
