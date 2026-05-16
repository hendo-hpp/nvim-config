-- plugin_install.lua

local uv = require('luv')

local data_dir = vim.fn.stdpath('data')
local plug_path = data_dir .. '/site/autoload/plug.vim'

local plug_not_installed = (vim.fn.empty(vim.fn.glob(plug_path)) == 1)

if plug_not_installed then
    print('installing vim-plug')

    vim.fn.system({
    	'curl', '-fLo', plug_path, '--create-dirs',
	'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    })    -- download vim-plug via curl and create directory structure

    vim.opt.runtimepath:append(plug_path)     -- refresh runtime path

    vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
	    vim.cmd('PlugInstall --sync | source $MYVIMRC')
	end
    })
end

local vim = vim
local plug = vim.fn['plug#']

-- benchmark time for plugin loading
-- https://neovim.io/doc/user/luvref/#uv.hrtime()
local start_time = uv.hrtime()

vim.loader.enable()
vim.call('plug#begin')

plug('nvim-treesitter/nvim-treesitter')

vim.call('plug#end')


local load_time = (uv.hrtime() - start_time) / 1e6
print(string.format('plugin load time: %.4f ms', load_time))
