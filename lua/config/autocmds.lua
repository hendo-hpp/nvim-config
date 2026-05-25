-- autocmd.lua
-- commands to be executed on specified events


-- lint if external linter is found for valid file types
local lint_events = { 
    'BufWritePost', 
    'BufEnter',
    'InsertLeave',
}


vim.api.nvim_create_autocmd(lint_events, {
    callback = function()
        require('lint').try_lint()
    end
})


-- activate lsp shortcuts when lsp becomes active in current buffer
local lsp_events = {
    'LspAttach',
}


vim.api.nvim_create_autocmd(lsp_events, {
    callback = function(args)
        local keymaps = require('config.keymaps')
	    keymaps.set_lsp_keymaps(args.buf)
    end,
})


-- convert file tree folders to match theme
local function apply_folder_colors()
    local orange = '#FFA657'
    vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { fg = orange })
    vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { fg = orange })
    vim.api.nvim_set_hl(0, 'NvimTreeEmptyFolderName', { fg = orange })
end


apply_folder_colors()


vim.api.nvim_create_autocmd('ColorScheme', {
    callback = apply_folder_colors,
})
