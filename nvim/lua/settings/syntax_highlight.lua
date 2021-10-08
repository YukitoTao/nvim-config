syntax='on'

-- Tokyonight theme configuration
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" } -- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.cmd[[colorscheme tokyonight]] -- Load the colorscheme
