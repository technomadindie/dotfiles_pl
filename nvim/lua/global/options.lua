-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set mapleader explicitly (currently set to default value)
vim.g.mapleader = "\\"

-- Sessions should be saved to a single directory
vim.g.session_dir = "~/.local/state/nvim/sessions"

-- Display line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Vim should indent with 3 spaces
vim.opt.shiftwidth = 3

-- h and l keypresses should wrap over lines
-- Pressing h at the beginning of a line should move cursor to the end of previous line
-- Pressing l at the end of a line should move cursor to the beginning of next line
vim.opt.whichwrap = "h,l"

-- Insert a line break at the first space after 100 characters
vim.opt.textwidth = 100

-- Search as you type (Do not wait for CR)
vim.opt.incsearch = true

-- Highlight searched pattern
vim.opt.hlsearch = true

-- Include all subdirectories of current directory recursively in the search path
vim.opt.path = ".,**"

-- Vertical splits should open on the right
vim.opt.splitright = true

-- Horizontal splits should open below
vim.opt.splitbelow = true

-- Expand <Tab> key to spaces
vim.opt.expandtab = true

-- Set number of spaces inserted by <Tab> key
vim.opt.tabstop = 3

-- Show key sequence pressed in normal mode. Shown in the right hand bottom
-- corner of the window
vim.opt.showcmd = true

-- Show statusline all the time
vim.opt.laststatus = 2

-- Don't jump to first character when paging. Column position remains constant
vim.opt.startofline = false

-- Allow switching from unsaved buffers
vim.opt.hidden = true

-- Determines the maximum number of items to show in the popup menu for
-- Insert mode completion.  When zero as much space as available is used.
vim.opt.pumheight = 6

-- Don't bother drawing the screen while executing macros or other automated or
-- scripted processes, just draw the screen as it is when the operation
-- completes
vim.opt.lazyredraw = true

-- If you are used to the behavior of shell autocomplete functions for completing
-- filenames, you can emulate it in Vim in command mode
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,list"

-- In insert mode completion, match the longest word/line
vim.opt.completeopt = "menu,longest,preview"

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.formatoptions = "trcqj"

vim.opt.colorcolumn = "100"
