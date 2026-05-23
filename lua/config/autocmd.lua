-- autocmd.lua
-- commands to be executed on specified events


--lint
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


-- lsp
local lsp_events = {
    'LspAttach',
}

vim.api.nvim_create_autocmd(lsp_events, {
    callback = function(args)
        local keymaps = require('config.keymaps')
	keymaps.set_lsp_keymaps(args.buf)
    end,
})
