-- autocmd.lua
-- commands to be executed on specified events

-- lint
vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function()
        require("lint").try_lint()
    end
}) 
