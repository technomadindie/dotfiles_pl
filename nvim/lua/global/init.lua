require("global.options")

require("global.remap")
require("global.autocommand")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
 })
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  "ngemily/vim-vp4",
  "vijaymarupudi/nvim-fzf",
  "ibhagwan/fzf-lua",
  { 'echasnovski/mini.nvim', version = false },
  {"nvim-treesitter/nvim-treesitter", build = "TSUpdate"},
  {"gennaro-tedesco/nvim-possession", config = true},
  {"folke/which-key.nvim", event = "VeryLazy",
   init = function()
     vim.o.timeout = true
     vim.o.timeoutlen = 300
   end, },
})

require("mini.ai").setup()
require("mini.cursorword").setup()
require("mini.indentscope").setup()
require("mini.statusline").setup()
require("mini.surround").setup()
require("mini.tabline").setup()

local starter = require("mini.starter")
starter.setup({
   autoopen = true,
   evaluate_single = true,
   items = {
      starter.sections.builtin_actions(),
      starter.sections.recent_files(10, false),
      starter.sections.recent_files(10, true),
   },
   content_hooks = {
      starter.gen_hook.adding_bullet(),
      starter.gen_hook.indexing('all', { 'Builtin actions' }),
      starter.gen_hook.padding(3, 2),
   },
})

require("nvim-possession").setup({
    sessions = {
        sessions_path = "/home/achinm/.local/state/nvim/sessions/"
    },

    autoload = false, -- whether to autoload sessions in the cwd at startup
    autosave = true, -- whether to autosave loaded sessions before quitting

    fzf_winopts = {
        -- any valid fzf-lua winopts options, for instance
        width = 0.5,
        preview = {
            vertical = "right:30%"
        }
    }
})

-- Which-key plugin is not needed right now, to activate, uncomment the line below
-- require("which-key").setup()

vim.cmd [[colorscheme minischeme]]

-- Find the fzf binary
vim.opt.runtimepath:append('/home/achinm/.fzf/bin')
