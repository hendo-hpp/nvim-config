-- keymaps.lua
-- keyboard shortcut configurations
-- https://neovim.io/doc/user/lua/#vim.keymap
 
local keymap_opts = { 
    noremap = true, -- disable recursive mappings
    silent = true   -- suppress command output
}

local function set_keymap(mode, key, action)
    vim.keymap.set(mode, key, action, keymap_opts)
end

-- leader key 
-- :help mapleader
set_keymap('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- keymap mode aliases
-- :help map-modes
local normal_mode = 'n'
local insert_mode = 'i'
local visual_mode = 'v'
local visual_line_mode = 'x'

-- normal mode
-- buffers

-- viewport
set_keymap(normal_mode, '<leader>,', '<C-o>') -- jump backward
set_keymap(normal_mode, '<leader>.', '<C-i>') -- jump forward

-- file
set_keymap(normal_mode, '<leader>w', ':w<CR>')   -- write
set_keymap(normal_mode, '<leader>wq', ':wq<CR>') -- write and exit
set_keymap(normal_mode, '<leader>qq', ':q!<CR>') -- force exit (no save)

-- copy
set_keymap({normal_mode, visual_mode}, '<leader>y', [["+y]]) -- selection
set_keymap(normal_mode, '<leader>Y', [["+Y]])                -- line
set_keymap(normal_mode, '<leader>yb', ':%y+<CR>')            -- buffer 


local theme_utils = require('config.themes')
set_keymap(normal_mode, '<leader>th', theme_utils.cycle_themes)


-- lsp keymaps
local M = {}

function M.set_lsp_keymaps(buf_num)
    local lsp_opts = { buffer = buf_num, noremap = true, silent = true }
    set_keymap(normal_mode, 'gd', vim.lsp.buf.definition, lsp_opts)          -- go to definition
    set_keymap(normal_mode, 'K', vim.lsp.buf.hover, lsp_opts)                -- keyword lookup
    set_keymap(normal_mode, '<leader>rn', vim.lsp.buf.rename, lsp_opts)      -- rename variable
    set_keymap(normal_mode, '<leader>ca', vim.lsp.buf.code_action, lsp_opts) -- code action
end

return M
