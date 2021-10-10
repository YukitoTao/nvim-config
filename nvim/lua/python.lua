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

-- Syntax highlighting
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'python', 'html', 'json', 'jsonc',
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
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
