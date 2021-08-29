local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options
local map = vim.api.nvim_set_keymap -- map keys easier


-- Bootstrap Paq when needed ------------------------------------------
local install_path = fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", install_path })
end

-- Plugins ------------------------------------------------------------
require("paq") ({
    "savq/paq-nvim",
    "hrsh7th/nvim-compe",
    "hoob3rt/lualine.nvim",

    "sainnhe/everforest",    -- colorscheme
    "folke/tokyonight.nvim", -- colorscheme

    "kyazdani42/nvim-web-devicons",
    "ryanoasis/vim-devicons",

    "kyazdani42/nvim-tree.lua",
  
})

-- gitsigns setup -----------------------------------------------------
--[[require("gitsigns").setup({
  numhl = true,
  signcolumn = false,
})--]]


-- colorscheme --------------------------------------------------------
cmd([[colorscheme tokyonight]]) -- Put your favorite colorscheme here

-- basics -------------------------------------------------------------
g.mapleader = " "
map('n', '<Leader>w', ':write<CR>', {noremap = true}) -- quicker save



-- lualine ------------------------------------------------------------
require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = "tokyonight",
    }
})


-- Nvim-Tree ----------------------------------------------------------
--nnoremap <C-n> :NvimTreeToggle<CR>
--nnoremap <leader>r :NvimTreeRefresh<CR>
--nnoremap <leader>n :NvimTreeFindFile<CR>
map('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true})
map('n', '<leader>r', ':NvimTreeRefresh<CR>', {noremap = true})
map('n', '<leader>n', ':NvimTreeFindFile<CR>', {noremap = true})

-- options ------------------------------------------------------------
opt.encoding = "utf-8" -- Set default encoding to UTF-8
opt.incsearch = true -- Shows the match while typing
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Size of an indent
opt.smartindent = true -- Insert indents automatically
opt.cursorline = true
opt.clipboard = "unnamedplus"

