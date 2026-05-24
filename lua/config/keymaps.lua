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


-- keymap mode alias
-- :help map-modes
local normal_mode = 'n'
local insert_mode = 'i'
local visual_mode = 'v'
local visual_line_mode = 'x'


-- viewport
set_keymap(normal_mode, '<leader>,', '<C-o>') -- jump backward
set_keymap(normal_mode, '<leader>.', '<C-i>') -- jump forward


-- buffer
set_keymap(normal_mode, '<leader>w', ':w<CR>')   -- write
set_keymap(normal_mode, '<leader>wq', ':wq<CR>') -- write and exit
set_keymap(normal_mode, '<leader>qq', ':q!<CR>') -- force exit (no save)


-- tabline specific buffer
set_keymap(normal_mode, '<A-,>', '<Cmd>BufferPrevious<CR>') -- nav to prev buffer
set_keymap(normal_mode, '<A-.>', '<Cmd>BufferNext<CR>')     -- nav to next buffer

set_keymap(normal_mode, '<A-<>', '<Cmd>BufferMovePrevious<CR>') -- move buffer pos left 
set_keymap(normal_mode, '<A->>', '<Cmd>BufferMoveNext<CR>')     -- move buffer pos right

set_keymap(normal_mode, '<A-1>', '<Cmd>BufferGoto 1<CR>') -- quick nav to first five buffers
set_keymap(normal_mode, '<A-2>', '<Cmd>BufferGoto 2<CR>')
set_keymap(normal_mode, '<A-3>', '<Cmd>BufferGoto 3<CR>')
set_keymap(normal_mode, '<A-4>', '<Cmd>BufferGoto 4<CR>')
set_keymap(normal_mode, '<A-5>', '<Cmd>BufferGoto 5<CR>')

set_keymap(normal_mode, '<leader>bp', '<Cmd>BufferPin<CR>')   -- (un)pin current buffer
set_keymap(normal_mode, '<leader>bc', '<Cmd>BufferClose<CR>') -- close current buffer


-- copy
set_keymap({normal_mode, visual_mode}, '<leader>y', [["+y]]) -- selection
set_keymap(normal_mode, '<leader>Y', [["+Y]])                -- line
set_keymap(normal_mode, '<leader>yb', ':%y+<CR>')            -- buffer 


-- theme
local theme_utils = require('config.themes')
set_keymap(normal_mode, '<leader>th', theme_utils.cycle_themes)


-- file tree
set_keymap(normal_mode, '<leader>f', ':NvimTreeToggle<CR>')



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
