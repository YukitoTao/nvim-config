-- Notify message manager
require("notify")(
  "Setting Language Server Protocol for Python project...\n\nPlease install following package:\n  pip install 'python-lsp-server[all]' black isort\n  yarn global add diagnostic-languageserver",
  "info"
)


-- Python for Data Science
vim.cmd[[let g:slime_target = "neovim"]]
vim.cmd[[let g:slime_preserve_curpos = 0]]
vim.cmd[[let g:slime_dont_ask_default = 1]]
vim.cmd[[let g:slime_cell_delimiter = "#%%"]]

function _G.StartREPL()
  vim.cmd[[
    execute 'terminal source virtualenv/bin/activate && ipython'
  ]]
  
  vim.api.nvim_exec([[
    let t:term_id = b:terminal_job_id
    wincmd p
    execute 'let b:slime_config = {"jobid": "'.t:term_id . '"}'
  ]], true)
end

vim.api.nvim_set_keymap('n', '<leader>vrepl', ':vsplit<CR><C-w>w:vertical resize 50<CR>:lua StartREPL()<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>repl', ':split<CR><C-w>j:resize 12<CR>:lua StartREPL()<CR>', { noremap=true, silent=true })

-- Syntax highlighting
require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "python", "html", "json", "jsonc",
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

-- Language server protocol
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require("lspconfig").pylsp.setup {
  capabilities = capabilities,
  filetypes = { "python" },
  cmd = { "pylsp" },
  cmd_env = { VIRTUAL_ENV = "./virtualenv" },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { 
          maxLineLength = 120
        },
        flake8 = {
          maxLineLength = 120
        }
      }
    }
  }
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
require("formatter").setup {
  logging = true,
  filetype = {
    python = {
      function ()
        return {
          exe = "~/.pyenv/shims/black",
          args = {"-"},
          stdin = true,
        }
      end,
      function ()
        return {
          exe = "~/.pyenv/shims/isort",
          args = {"-"},
          stdin = true,
        }
      end
    },
  }
}
vim.api.nvim_set_keymap("n", "<leader>p", ":Format<CR>", { noremap=true })
