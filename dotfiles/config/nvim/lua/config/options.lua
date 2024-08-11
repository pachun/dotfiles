vim.opt.termguicolors = true -- enable 24-bit color (better colors)
vim.g.netrw_liststyle = 3 -- make vim's :Explore command show directories and files in a tree format
vim.opt.relativenumber = true -- show line numbers relative to the cursor in vim
vim.opt.number = true -- show the cursor line's real line number in the file
vim.opt.shiftwidth = 2 -- indenting looks like two spaces
vim.opt.expandtab = true -- indenting really is two spaces
vim.opt.wrap = false
vim.opt.ignorecase = true -- do case insensitive searches
vim.opt.smartcase = true -- do case sensitive searches when the search includes mixed casing
vim.opt.cursorline = false -- do not highlight the line that the cursor is on
vim.opt.termguicolors = true -- use all our colors
vim.opt.background = "dark" -- prefer dark color schemes
vim.opt.signcolumn = "yes" -- show line statuses to the left of line numbers; a bunch of plugins will use this. when not in use, it makes the gutter fatter

-- I can't discern what these options do... I want to leave them out. But cool people use them. They couldn't be doing nothing, right?
vim.opt.tabstop = 2 -- Why? Everything I can test works great with the options above.
vim.opt.autoindent = true -- Why? It already auto indents, given what the options above.
vim.opt.backspace = "indent,eol,start" -- why? It already lets me backspace this stuff.
vim.opt.clipboard:append("unnamedplus") -- why? seems to work, already. system copy & paste uses the same registers as vim yank and paste
vim.opt.splitright = true -- why? already happens
vim.opt.splitbelow = true -- why? already happens
