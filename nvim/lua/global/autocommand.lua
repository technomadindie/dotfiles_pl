-- Display cursorcolumn and cursorline only in the active window

vim.api.nvim_create_autocmd({"WinEnter", "VimEnter"}, {
   pattern = { "*" },
   command = "set cursorline",
   group = grp_cursor,
})

vim.api.nvim_create_autocmd({"WinLeave"}, {
   pattern = { "*" },
   command = "set nocursorline",
   group = grp_cursor,
})

vim.api.nvim_create_autocmd({"WinEnter", "VimEnter"}, {
   pattern = { "*" },
   command = "set cursorcolumn",
   group = grp_cursor,
})

vim.api.nvim_create_autocmd({"WinLeave"}, {
   pattern = { "*" },
   command = "set nocursorcolumn",
   group = grp_cursor,
})

-- Use gf and its variants without specifying the extension of the file
-- Vim will automatically add the extension to file/module name

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
   pattern = { "*.sv", "*.svh", "*.v" },
   command = "set suffixesadd=.sv,.svh,.v",
   group = grp_verilog,
})

-- K does not work well for Verilog family of languages

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
   pattern = { "*.sv", "*.svh", "*.v" },
   command = "nnoremap K <nop>",
   group = grp_verilog,
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
   pattern = { "*.vx" },
   command = "set filetype=viva",
   group = grp_verilog,
})

