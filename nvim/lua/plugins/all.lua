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
  --       Theme Plugins                     --
  --       UI                                --
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
  use 'neovim/nvim-lspconfig'
end)
