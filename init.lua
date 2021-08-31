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
    "kdheepak/tabline.nvim",

    "sainnhe/everforest",    -- colorscheme
    "folke/tokyonight.nvim", -- colorscheme

    "kyazdani42/nvim-web-devicons",
    "ryanoasis/vim-devicons",

--    "kyazdani42/nvim-tree.lua",

    "nvim-telescope/telescope.nvim",
--    "nvim-treesitter/nvim-treesitter",

--    "ixru/nvim-markdown", -- Markdown mode

    "nvim-lua/plenary.nvim", -- this is required for neogit
    "TimUntersberger/neogit", -- magit like extension for neovim

    "kristijanhusak/orgmode.nvim",
  
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
map('n', '<Leader>fs', ':write<CR>', {noremap = true}) -- quicker save
map('n', '<C-t>', ':tabnew<CR>', {noremap = true}) -- toggle between tabs
map('n', '<Leader>bn', ':bn<CR>', {noremap = true}) -- cycle through buffers
map('n', '<Leader>t', ':tabnext<CR>', {noremap = true})
map('n', '<Leader>bd', ':bd<CR>', {noremap = true})

map('n', '<C-h>', '<C-w>h', {noremap = true})
map('n', '<C-j>', '<C-w>j', {noremap = true})
map('n', '<C-k>', '<C-w>k', {noremap = true})
map('n', '<C-l>', '<C-w>l', {noremap = true})

-- lualine ------------------------------------------------------------
require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = "tokyonight",
    }
})

-- tabline ------------------------------------------------------------
require('tabline').setup {}

-- Nvim-Tree ----------------------------------------------------------
--nnoremap <C-n> :NvimTreeToggle<CR>
--nnoremap <leader>r :NvimTreeRefresh<CR>
--nnoremap <leader>n :NvimTreeFindFile<CR>
--map('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true})
--map('n', '<leader>r', ':NvimTreeRefresh<CR>', {noremap = true})
--map('n', '<leader>n', ':NvimTreeFindFile<CR>', {noremap = true})
--g.nvim_tree_side = 'right'
--g.nvim_tree_width = '40'
--g.nvim_tree_quit_on_open = 0
--g.nvim_tree_disable_keybindings = 1

-- neogit -------------------------------------------------------------
local neogit = require('neogit')
neogit.setup {}
map('n', '<Leader>gs', ':Neogit<CR>', {noremap = true})

-- telescope ----------------------------------------------------------
require('telescope').setup{}
map('n', '<Leader>ff', ':Telescope find_files<CR>', {noremap = true})
map('n', '<Leader>fg', ':Telescope live_grep<CR>', {noremap = true})
map('n', '<Leader>fb', ':Telescope buffers<CR>', {noremap = true})
map('n', '<Leader>fh', ':Telescope help_tags<CR>', {noremap = true})

-- treesitter highlighting --------------------------------------------
--[[require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "json", "lua", "php", "python", "scss", "yaml", "typescript", "rst" },
  highlight = {
    enable = true,              -- false will disable the whole extension
    --disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
]]--

-- writing ------------------------------------------------------------
require('orgmode').setup{}

-- options ------------------------------------------------------------
opt.encoding = "utf-8" -- Set default encoding to UTF-8
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Size of an indent
opt.smartindent = true -- Insert indents automatically
opt.cursorline = true
opt.clipboard = "unnamedplus"
opt.incsearch = true -- Shows the match while typing
opt.hlsearch = true -- Highlight found searchresults
opt.ignorecase = true
opt.number = true
opt.numberwidth = 5
opt.scrolloff = 20

