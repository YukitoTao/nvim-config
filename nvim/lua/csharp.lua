require('notify')(
  "Setting Language Server Protocol for C# project...\n\nPlease install following packages:\n  brew install --cask dotnet-sdk \n  dotnet tool install --global csharp-ls \n  yarn global add diagnostic-languageserver\n\nIgnore this message if those packages already installed.",
  "info"
)

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('lspconfig').html.setup {
  capabilities = capabilities,
}

require('lspconfig').csharp_ls.setup {
  capabilities = capabilities,
  cmd = { "/Users/yuki/.dotnet/tools/csharp-ls" }
}

-- Syntax highlighting
require('nvim-treesitter.configs').setup {
  autotag = {
    enable = true,
  },
  ensure_installed = { 
    'c_sharp', 'javascript', 'html',
    'jsdoc', 'json', 'jsonc',
    'scss'
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

-- Formatter setup 
vim.api.nvim_set_keymap("n", "<leader>p", ":! dotnet format --include %<CR>", { noremap=true })
