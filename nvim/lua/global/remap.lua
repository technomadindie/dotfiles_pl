-- 'jk' is almost never a substring that we need to type
-- It serves as a convenient way to press <Esc>
vim.keymap.set("i", "jk", "<Esc>")

-- 'U' in normal mode is just plain confusing. It can do more harm than good.
vim.keymap.set("n", "U", "<nop>")

-- Remap 'Y' to be consistent with C and D
vim.keymap.set("n", "Y", "y$")

-- When refreshing screen, clear highlights of last seach pattern
vim.keymap.set("n", "<C-l>", "<cmd>nohlsearch<CR><cmd>let @/=''<CR>", { silent = true })

-- Select the last changed text
vim.keymap.set("n", "gV", "`[v`]")

-- Remap arrow keys to move by screen line
vim.keymap.set("n", "<Up>", "gk")
vim.keymap.set("n", "<Down>", "gj")

-- Trigger fuzzy file search from current directory
vim.keymap.set("n", "<C-Space>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })

-- Trigger string search from current directory
vim.keymap.set("n", "<C-q>", "<cmd>lua require('fzf-lua').grep_project()<CR>", { silent = true })

-- Run nvim-possession's list commmand
vim.api.nvim_create_user_command("Sessions", "lua require('nvim-possession').list()", {})

-- Remap <tab> to navigate tabs
vim.keymap.set("n", "<Tab>", "gt")

-- Command line abbreviations
-- Only write if the file has been modified
vim.cmd.cabbrev({args = {"w <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'up' : 'w')<CR>"}})

-- Imitate behavior of vsplit for family of 'b' commands
vim.cmd.cabbrev({args = {"vsb <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert sb' : 'vsb')<CR>"}})

-- Imitate behavior of tabsplit for family of 'b' commands
vim.cmd.cabbrev({args = {"tsb <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'tab sb' : 'tsb')<CR>"}})

-- Use FZF for searching and previewing loaded buffers
vim.cmd.cabbrev({args = {"ls <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'FzfLua buffers' : 'ls')<CR>"}})
