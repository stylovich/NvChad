-- vim.g.vscode_snippets_path = "~/.config/Code/User/snippets"

local opt = vim.opt

-- opt.colorcolumn = "120" -- Line length marker
opt.cursorcolumn = false -- Highlight the current column
opt.number = true -- Print line number
opt.relativenumber = false -- Show line numbers relative to the line with the cursor
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for
opt.cursorline = true -- Highlight the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Insert indents automatically
opt.smarttab = true -- Insert indents automatically
opt.wrap = true -- Display long lines as just one line
opt.termguicolors = true -- True color support
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true -- Override the 'ignorecase' option if the search pattern contains upper case characters
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.mouse = "a" -- Enable your mouse
opt.showtabline = 2 -- Always show tabs

vim.cmd "silent! command! NvCloseAllBuf lua require('nvchad_ui/tabufline').closeAllBufs('')"
