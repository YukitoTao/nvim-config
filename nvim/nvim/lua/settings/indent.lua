-- Default tabspace configuration
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.cmd[[:set nofoldenable]]

-- Indentation style
vim.opt.autoindent = true
vim.g.indentLine_char='|'
vim.opt.foldmethod='indent'

-- JSON quotes
vim.cmd[[let g:indentLine_conceallevel=2]]
