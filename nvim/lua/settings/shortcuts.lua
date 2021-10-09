local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- Split window switch shortcuts
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- Copy file name to clipboard
keymap('n', '<leader>cp', ':let @+ = expand("%")<CR>', opts) -- copy relative path
keymap('n', '<leader>cP', ':let @+ = expand("%:p")<CR>', opts) -- copy full path
keymap('n', '<leader>cd', ':let @*=expand("%:h")<CR>', opts) -- copy directory path
keymap('n', '<leader>cn', ':let @+ = expand("%:t")<CR>', opts) -- copy file name

-- Show current Buffers list
keymap('n', '<leader>b', ':Buffers<CR>', opts)

-- Show Git blame information
keymap('n', '<leader>gb', ':<C-u>call gitblame#echo()<CR>', opts)
