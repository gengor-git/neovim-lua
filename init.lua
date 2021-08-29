local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options


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
    "ryanoasis/vim-devicons"
  
})

-- gitsigns setup -----------------------------------------------------
--[[require("gitsigns").setup({
  numhl = true,
  signcolumn = false,
})--]]


cmd([[colorscheme tokyonight]]) -- Put your favorite colorscheme here


-- lualine ------------------------------------------------------------
require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = "tokyonight",
    }
})

-- options ------------------------------------------------------------
opt.encoding = "utf-8" -- Set default encoding to UTF-8
opt.incsearch = true -- Shows the match while typing
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Size of an indent
opt.smartindent = true -- Insert indents automatically
opt.cursorline = true
opt.clipboard = "unnamedplus"



