require('notify')(
  "Setting Language Server Protocol for Javascript project...\nPlease install following packages:\n  npm i -g vscode-langservers-extracted stylelint-lsp typescript typescript-language-server\n\nSetting code formating...\nPlease install the following packages:\n  npm i -g prettier prettier-eslint eslint",
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

-- Syntax highlighting
require('nvim-treesitter.configs').setup {
  autotag = {
    enable = true,
  },
  ensure_installed = {
    'javascript', 'html', 'jsdoc', 'json', 'jsonc',
    'scss', 'tsx', 'typescript'
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    custom_captures = {
      ["foo.bar"] = "Identifier",
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      scope_incremental = "grc",
      node_incremental = "grn",
      node_decremental = "grm",
    },
  },
}
