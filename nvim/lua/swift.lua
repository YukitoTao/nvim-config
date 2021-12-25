require('notify')(
  "Setting Language Server Protocol for Swift-IOS project...\n\nPlease install following packages:\n  brew install swiftlint swiftformat\n  yarn global add diagnostic-languageserver\n\nIgnore this message if those packages already installed.",
  "info"
)

-- Language server protocol
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require'lspconfig'.sourcekit.setup{
  capabilities = capabilities,
}

-- Syntax highlighting
require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "swift", "json", "jsonc",
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

-- Formatter setup 
local swift_fmt = {
  function()
    return {
      exe = "swiftformat",
      args = {"--quiet", "--stdinpath", vim.api.nvim_buf_get_name(0)},
      stdin = true,
    }
  end
}
 
require('formatter').setup {
  logging = true,
  filetype = {
    swift = swift_fmt,
  }
}

vim.api.nvim_set_keymap("n", "<leader>p", ":Format<CR>", { noremap=true })
