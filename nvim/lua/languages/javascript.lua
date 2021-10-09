require('notify')(
  "Please install following LSP to enable this feature.\nRun: npm i -g vscode-langservers-extracted stylelint-lsp typescript typescript-language-server",
  "warn"
)

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').html.setup {
  capabilities = capabilities,
}
require('lspconfig').stylelint_lsp.setup{}
require('lspconfig').tsserver.setup{}

