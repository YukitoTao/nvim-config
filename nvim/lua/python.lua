-- Notify message manager
require("notify")(
  "Setting Language Server Protocol for Python project...\n\nPlease install following package:\n  pip install --upgrade 'python-lsp-server[all]' black isort\n  yarn global add diagnostic-languageserver\n\nIgnore this message if those packages already installed.",
  "info"
)

-- Python for Data Science
require("notify")(
  "Setting Data Science project...\n\nPlease install following package to your virutalenv:\n  pip install --upgrade 'ipython[all]' neovim pynvim\n\nIgnore this message if those packages already installed.",
  "info"
)
vim.cmd[[let g:python3_host_prog = 'virtualenv/bin/python3']]
vim.cmd[[let g:slime_python_ipython = 1]]
vim.cmd[[let g:slime_target = "neovim"]]
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

vim.api.nvim_set_keymap('n', '<leader>vrepl', ':vsplit<CR><C-w>w:vertical resize 60<CR>:lua StartREPL()<CR>', { noremap=true, silent=true }) -- Open IPython console vertially
vim.api.nvim_set_keymap('n', '<leader>repl', ':split<CR><C-w>j:resize 12<CR>:lua StartREPL()<CR>', { noremap=true, silent=true }) -- Open IPthon console horizontally
vim.api.nvim_set_keymap('n', '<leader>R', ':IPythonCellRunTime<CR>', { noremap=true }) -- Run entire script and time the execution
vim.api.nvim_set_keymap('n', '<leader>C', ':IPythonCellExecuteCellJump<CR>', { noremap=true }) -- Execute the current cell and jump to the next cell
vim.api.nvim_set_keymap('n', '<leader>l', ':IPythonCellClear<CR>', { noremap=true }) -- Clear IPython screen
vim.api.nvim_set_keymap('n', '<leader>x', ':IPythonCellClose<CR>', { noremap=true }) -- Close all Matplotlib figure windows
vim.api.nvim_set_keymap('n', '[c', ':IPythonCellPrevCell<CR>', { noremap=true }) -- Jump to the previous cell header
vim.api.nvim_set_keymap('n', ']c', ':IPythonCellNextCell<CR>', { noremap=true }) -- Jump to the next cell header
vim.api.nvim_set_keymap('x', '<leader>h', '<Plug>SlimeRegionSend', {}) -- Send the current selection to IPython
vim.api.nvim_set_keymap('n', '<leader>rp', ':IPythonCellPrevCommand<CR>', { noremap=true }) -- Run the previous command
vim.api.nvim_set_keymap('n', '<leader>I', ':IPythonCellInsertAbove<CR>a', {}) -- Insert a cell header tag above and enter insert mode
vim.api.nvim_set_keymap('n', '<leader>i', ':IPythonCellInsertBelow<CR>a', {}) -- Insert a cell header tag below and enter insert mode

vim.api.nvim_set_keymap('n', '<leader>r', ':IPythonCellRun<CR>', { noremap=true }) -- Run entire script
vim.api.nvim_set_keymap('n', '<leader>c', ':IPythonCellExecuteCell<CR>', { noremap=true }) -- Execute the current cell
vim.api.nvim_set_keymap('n', '<leader>h', '<Plug>SlimeLineSend', {}) -- Send the current line to IPython
vim.api.nvim_set_keymap('n', '<leader>Q', ':IPythonCellRestart<CR>', { noremap=true }) -- Exit IPython
vim.api.nvim_set_keymap('n', '<leader>d', ':SlimeSend1 %debug<CR>', { noremap=true }) -- Start debug mode
vim.api.nvim_set_keymap('n', '<leader>q', ':SlimeSend1 exit<CR>', { noremap=true }) -- Exit debug mode or IPython

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
          maxLineLength = 120,
          ignore = { "E402" }
        },
        flake8 = {
          maxLineLength = 120,
          ignore = { "E402" }
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
