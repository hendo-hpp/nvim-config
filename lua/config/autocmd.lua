-- autocmd.lua
-- commands to be executed on specified events

-- event aliases
local buffer_write = "BufWritePost"
local buffer_enter = "BufEnter"
local insert_mode_exit = "InsertLeave"


-- lint
local lint_events = { buffer_write, buffer_enter, insert_mode_exit }

vim.api.nvim_create_autocmd(lint_events, {
    callback = function()
        require("lint").try_lint()
    end
})
