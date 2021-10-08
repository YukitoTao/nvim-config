return require('packer').startup(function()
  -- Package managerment
  use 'wbthomason/packer.nvim'

  -- ======================================= --
  --     File system explorer Plugins        --
  -- ======================================= --
  use 'preservim/nerdtree' 

  -- ======================================= --
  --           Indent Plugins                --
  -- ======================================= --
  use 'Yggdroot/indentLine'
  
  -- ======================================= --
  --       Syntax Highlight Plugins          --
  -- ======================================= --
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  } 
  use 'nvim-treesitter/playground'
  require('nvim-treesitter.configs').setup{
    ensure_installed = {
      'dockerfile', 'html', 'css', 'jsdoc', 'json',
      'json5', 'jsonc', 'regex', 'scss', 'yaml',
      'regex', 'query'
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true, -- false will disable the whole extension 
      custom_captures = {
        ['foo.bar'] = 'Identifier', -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      },
      additional_vim_regex_highlighting= false,
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'gnn',
        scope_incremental = 'grc',
        node_incremental = 'grn',
        node_decremental = 'grm',
      },
    },
  }

  -- ======================================= --
  --              Theme Plugins              --
  -- ======================================= --
  use {
    'folke/tokyonight.nvim',
    branch = 'main'
  }


  -- ======================================= --
  --             Finder Plugins              --
  -- ======================================= --
  use {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']() end
  }
  use 'junegunn/fzf.vim'
end)
