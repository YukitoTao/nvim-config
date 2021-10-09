-- Notify message manager
require('notify')(
  "Please install following LSP to enable this feature.\nRun: pip install 'python-lsp-server[all]'",
  "warn"
)

-- Language server protocol
require('lspconfig').pylsp.setup{}
