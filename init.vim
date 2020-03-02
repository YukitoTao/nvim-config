" Default Vim configuration
set autoread
set mouse=a
set clipboard=unnamedplus
set number
set title
set autoindent
set tabstop=2
set shiftwidth=2
set laststatus=2
set expandtab
set foldmethod=indent
set cursorline
set updatetime=100

syntax on
colorscheme darkblue
highlight Normal ctermfg=252 ctermbg=235
highlight CursorLine cterm=NONE ctermbg=4
highlight Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
highlight PmenuSel ctermfg=15 ctermbg=28 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" Difftool configuring
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" Custom key map configuring
 tnoremap <Esc> <C-\><C-N>

" Minimalist Vim Plugin Manager
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tmux-plugins/tpm', {'do': 'brew install tmux --force'}
Plug 'tmux-plugins/tmux-sensible'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'digitaltoad/vim-pug'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'tpope/vim-pathogen'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', { 'do': 'brew install the_silver_searcher ripgrep' }
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'
Plug 'Galooshi/vim-import-js', { 'do': 'npm install -g import-js' }

call plug#end()

" NERDTree configuring
let NERDTreeShowHidden=1

" Check syntax in Vim asynchronously and fix files for Vim
set completeopt=menu,menuone,preview,noselect,noinsert
set omnifunc=ale#completion#OmniFunc
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 1
let g:ale_completion_tsserver_autoimport = 1
let g:ale_fixers = {
			\   '*': ['remove_trailing_lines', 'trim_whitespace'],
			\   'javascript': ['prettier', 'eslint'],
			\}

" Tern plugin for Vim
execute pathogen#infect()
filetype plugin indent on

" Expanding abbreviations for Vim
let g:user_emmet_leader_key='<Tab>'

" Vastly improved Javascript indentation and syntax support in Vim
let g:indentLine_char = '⎸'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" Lean & mean status/tabline for vim
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:ackprg = 'ag --vimgrep'

" Tmux navigator configuring
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-j> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-k> :TmuxNavigateDown<cr>
nnoremap <silent> <C-i> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
