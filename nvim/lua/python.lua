-- Notify message manager
require('notify')(
  "Setting Language Server Protocol for Python project...\n\nPlease install following package:\n  pip install 'python-lsp-server[all]' black isort\n  yarn global add diagnostic-languageserver",
  "info"
)

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Language server protocol
require('lspconfig').pylsp.setup {
  capabilities = capabilities,
  filetypes = { 'python' },
  cmd = { 'pylsp' },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { 
          maxLineLength = 80
        },
        flake8 = {
          maxLineLength = 80
        }
      }
    }
  }
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

-- Linter setup
local filetypes = {
  python = "flake8",
}

local linters = {
  flake8 = {
    command = "flake8",
    sourceName = "flake8",
    args = {"--format", "%(row)d:%(col)d:%(code)s: %(text)s", "%file"},
    formatPattern = {
      "^(\\d+):(\\d+):(\\w+):(\\w).+: (.*)$",
      {
          line = 1,
          column = 2,
          message = {"[", 3, "] ", 5},
          security = 4
      }
    },
    securities = {
      E = "error",
      W = "warning",
      F = "info",
      B = "hint",
    },
  },
}

require("lspconfig").diagnosticls.setup {
  filetypes = vim.tbl_keys(filetypes),
  init_options = {
    filetypes = filetypes,
    linters = linters,
  },
}

-- Formatter setup 
require('formatter').setup {
  logging = true,
  filetype = {
    python = {
      function ()
        return {
          exe = '~/.pyenv/shims/black',
          args = {"-"},
          stdin = true,
        }
      end,
      function ()
        return {
          exe = '~/.pyenv/shims/isort',
          args = {"-"},
          stdin = true,
        }
      end
    },
  }
}
vim.api.nvim_set_keymap('n', '<leader>p', ':Format<CR>', { noremap=true })
