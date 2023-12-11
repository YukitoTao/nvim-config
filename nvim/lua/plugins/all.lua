return require('packer').startup(function()
  -- Package managerment
  use 'wbthomason/packer.nvim'
  
  -- ======================================= --
  --           Outline Viewer Plugins                --
  -- ======================================= --
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5'
  }

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
  --       Theme Plugins                     --
  --       UI Plugins                        --
  -- ======================================= --
  use 'folke/tokyonight.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'creativenull/diagnosticls-configs-nvim',
    tag = 'v0.1.2'
  }
  use {
    'daviddavis/vim-colorpack'
  }
  -- ======================================= --
  --             Finder Plugins              --
  -- ======================================= --
  use {
    'junegunn/fzf',
    run = function() vim.fn['fzf#instal']() end
  }
  use 'junegunn/fzf.vim'

  -- ======================================= --
  --        Notify Manager Plugins           --
  -- ======================================= --
  use 'rcarriga/nvim-notify'

  -- ======================================= --
  --        Git Information Plugins          --
  -- ======================================= --
  use 'airblade/vim-gitgutter'
  use 'zivyangll/git-blame.vim'
  use 'tpope/vim-fugitive'

  -- ======================================= --
  --    Language Server Protocol Plugins     --
  --    Autocompletion Plugins               -- 
  -- ======================================= --
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'windwp/nvim-ts-autotag'
  use 'jpalardy/vim-slime'
  use 'hanschen/vim-ipython-cell'
  use 'razzmatazz/csharp-language-server'

  -- ======================================= --
  --          Commentary Plugins             --
  --          Formatter Plugins              --
  -- ======================================= --
  use 'tpope/vim-commentary'
  use 'mhartington/formatter.nvim'

  -- ===================================== --
  --          Termianl Plugins             --
  -- ===================================== --
  use {
    "akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
    require("toggleterm").setup()
  end}
end)
