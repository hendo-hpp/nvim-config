-- plugin_install.lua
-- checks for, and downloads vim-plug, and then loads plugins specified by user


local uv = require('luv')


local data_dir = vim.fn.stdpath('data')
local plug_path = data_dir .. '/site/autoload/plug.vim'
local plug_not_installed = (vim.fn.empty(vim.fn.glob(plug_path)) == 1)

if plug_not_installed then
    print('installing vim-plug')

    vim.fn.system({
        'curl', '-fLo', plug_path, '--create-dirs',
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    })

    vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
        vim.cmd('PlugInstall --sync | source $MYVIMRC')
    end
    })
end

local vim = vim
local plug = vim.fn['plug#']

local start_time = uv.hrtime()

vim.call('plug#begin', vim.fn.stdpath('data') .. '/plugged')

plug('mfussenegger/nvim-lint')
plug('neovim/nvim-lspconfig')
plug('nvim-lualine/lualine.nvim')
plug('nvim-tree/nvim-web-devicons')
plug('nvim-treesitter/nvim-treesitter', { ['branch'] = 'master', ['do'] = ':TSUpdate' })
plug('nvim-tree/nvim-tree.lua')

vim.call('plug#end')

vim.loader.enable()

require('plugins.treesitter')
require('plugins.lint')
require('plugins.lsp')
require('plugins.lualine')
require('plugins.icons')
require('plugins.filetree')

local load_time = (uv.hrtime() - start_time) / 1e6
print(string.format('plugin load time: %.2f ms', load_time))
