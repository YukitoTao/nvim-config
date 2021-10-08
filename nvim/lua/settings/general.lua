-- General Neo-Vim configuration 
vim.opt.title=true
vim.opt.encoding='utf-8'
vim.opt.mouse='a'
vim.opt.cursorline=true

-- “Hybrid” line numbers
-- Automatic toggling between line number modes
vim.opt.number=true
vim.cmd[[
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
]]
