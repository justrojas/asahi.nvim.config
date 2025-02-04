---@type ChadrcConfig
local M = {}

-- UI configuration
M.ui = {
  theme = "tokyodark",
  transparency = true,
}

-- Plugin and mapping configurations
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

-- Folding configuration
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldtext =
  [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
vim.opt.fillchars = { fold = "·" }
vim.opt.foldcolumn = "0"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 3
vim.opt.foldminlines = 1
vim.cmd [[highlight Folded guibg=#2d3149 guifg=#a9b1d6]]
-- Vim options
local function set_options()
  vim.wo.relativenumber = true
  vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

  -- Set shiftwidth to 0 for all filetypes
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "setlocal shiftwidth=0",
  })
end

-- Lua rocks configuration
local function setup_luarocks()
  local home = vim.fn.expand "$HOME"
  package.path = package.path .. ";" .. home .. "/.luarocks/share/lua/5.1/?/init.lua;"
  package.path = package.path .. ";" .. home .. "/.luarocks/share/lua/5.1/?.lua;"
end

-- Initialize everything
local function init()
  set_options()
  setup_luarocks()
end

init()

-- Custom remapping
-- vim.api.nvim_set_keymap("n", "0", "$", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "9", "^", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "8", "0", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "p", ":pu<CR>]==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "P", ":pu!<CR>]==", { noremap = true, silent = true })

return M
