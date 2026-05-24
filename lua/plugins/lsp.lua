-- lsp.lua
--  
-- https://github.com/neovim/nvim-lspconfig

local status, lspconfig = pcall(require, 'lspconfig')
if not status then
    return
end


local language_servers = {
    'clangd',        -- c, cpp
    'ruff',          -- python
    'rust_analyzer', -- rust
    'lua_ls',        -- lua
}


for _, server in ipairs(language_servers) do
    vim.lsp.enable(server)
end
