-- lualine.lua
-- status bar
-- https://github.com/nvim-lualine/lualine.nvim


local status, lualine = pcall(require, 'lualine')
if not status then
    return
end


lualine.setup({
    options = {
        theme = 'auto', -- match current editor theme
    	
        component_separators = { left = '│', right = '│' },
        section_separators = { left = '', right = '' },

        disabled_filetypes = {
            statusline = { 'NvimTree' }, -- do not show the status line in the file tree
        },
    },

    sections = {
        lualine_a = { 'mode' },                                -- editor mode
        lualine_b = { 'branch', 'diff', 'diagnostics' },       -- git branch
        lualine_c = { { 'filename', path = 1 } },              -- active buffer
        lualine_x = { 'encoding', 'fileformat', 'filetype' },  -- file info
        lualine_y = { 'progress' },                            -- current line # / last line #
        lualine_z = { 'location' }                             -- cursor position in buffer
    }
})
