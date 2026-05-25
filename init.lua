-- init.lua
-- hendo.hpp's nvim config


-- editor configurations
require('config.autocmds')
require('config.keymaps')
require('config.options')


-- download plug and load plugins
require('plugins.plugin_init')


-- default editor theme
vim.cmd('colorscheme ghdark')
