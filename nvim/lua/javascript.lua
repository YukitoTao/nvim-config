require('notify')(
  "Setting Language Server Protocol for Javascript project...\n\nPlease install following packages:\n  npm i -g vscode-langservers-extracted stylelint-lsp \\\n           typescript typescript-language-server\\\n           prettier prettier-eslint eslint\n  yarn global add diagnostic-languageserver",
  "info"
)

-- Code formatter with Prettier & Eslint
vim.cmd[[nnoremap <leader>p :silent !prettier-eslint % --write<CR>]]

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

-- Linter Setup
local filetypes = {
  typescript = "eslint",
  typescriptreact = "eslint",
  javascript = "eslint",
  javascriptreact = "eslint",
}

local linters = {
  eslint = {
    sourceName = "eslint",
    command = "./node_modules/.bin/eslint",
    rootPatterns = {".eslintrc", ".eslintrc.js", "package.json"},
    debouce = 50,
    args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
    parseJson = {
      errorsRoot = "[0].messages",
      line = "line",
      column = "column",
      endLine = "endLine",
      endColumn = "endColumn",
      message = "${message} [${ruleId}]",
      security = "severity"
    },
    securities = {[2] = "error", [1] = "warning"}
  },
}
 
require('lspconfig').diagnosticls.setup {
  filetypes = vim.tbl_keys(filetypes),
  init_options = {
    filetypes = filetypes,
    linters = linters,
  },
}

-- Formatter Setup
local eslint_fmt = {
  function()
    return {
      exe = "./node_modules/.bin/eslint",
      args = {"--fix", vim.api.nvim_buf_get_name(0)},
      stdin = false,
    }
  end
}
 
require('formatter').setup {
  logging = true,
  filetype = {
    typescript = eslint_fmt,
    typescriptreact = eslint_fmt,
    javascript = eslint_fmt,
    javascriptreact = eslint_fmt,
  }
}
-- vim.api.nvim_set_keymap('n', '<leader>p', ':Format<CR>', { noremap=true })
