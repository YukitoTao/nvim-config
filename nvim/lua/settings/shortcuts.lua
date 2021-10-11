local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- Prettier formating
vim.cmd[[nnoremap <leader>p :silent !prettier-eslint % --write<CR>]]

-- Termial shortcuts
vim.cmd[[:tnoremap <Esc> <C-\><C-n>]]
keymap('n', '<leader>vt', ':vsplit<CR><C-w>w:vertical resize 50<CR>:terminal<CR>', { noremap=true, silent=true })
keymap('n', '<leader>t', ':split<CR><C-w>j:resize 12<CR>:terminal<CR>', { noremap=true, silent=true })

-- Split window switch shortcuts
keymap('n', '<C-j>', '<c-w>j', opts)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Copy file name to clipboard
keymap('n', '<leader>cp', ':let @+ = expand("%")<CR>', opts) -- copy relative path
keymap('n', '<leader>cP', ':let @+ = expand("%:p")<CR>', opts) -- copy full path
keymap('n', '<leader>cd', ':let @*=expand("%:h")<CR>', opts) -- copy directory path
keymap('n', '<leader>cn', ':let @+ = expand("%:t")<CR>', opts) -- copy file name

-- Show current Buffers list
keymap('n', '<leader>b', ':Buffers<CR>', opts)

-- Show Git blame information
keymap('n', '<leader>gb', ':<C-u>call gitblame#echo()<CR>', opts)

-- Language Server Protocol
local lsp_options ={ noremap=true, silent=true } 
keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', lsp_options)
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', lsp_options)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', lsp_options)
keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', lsp_options)
keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', lsp_options)
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', lsp_options)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', lsp_options)
keymap('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', lsp_options)
keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', lsp_options)
keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', lsp_options)
keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', lsp_options)
keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', lsp_options)
keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', lsp_options)
keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', lsp_options)
keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', lsp_options)
keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', lsp_options)
keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', lsp_options)
