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


-- keymap modes
-- :help map-modes
local normal_mode = 'n'
local insert_mode = 'i'
local visual_mode = 'v'
local visual_line_mode = 'x'

-- normal mode
-- buffers

-- windows

-- file
set_keymap(normal_mode, '<leader>w', ':w<CR>')      -- write
set_keymap(normal_mode, '<leader>wq', ':wq<CR>')    -- write and exit
set_keymap(normal_mode, '<leader>qq', ':q!<CR>')    -- force exit (no save)

set_keymap(normal_mode, '<leader>y', '":+y')        -- copy selection
set_keymap(normal_mode, '<leader>Y', ':%y+<CR>')    -- copy file 


-- visual mode

