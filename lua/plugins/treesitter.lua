-- treesitter.lua
-- nvim-treesitter configs
-- https://github.com/nvim-treesitter/nvim-treesitter/tree/main


local prog_languages = {
    'asm', 
    'bash', 
    'c', 'cmake', 'cpp', 'cuda', 
    'gitattributes', 'gitignore', 'glsl', 
    'haskell', 
    'java', 'javascript', 'json',
    'lua', 
    'make', 'markdown', 
    'python', 
    'rust',
    'typescript',
}

local status, configs = pcall(require, 'nvim-treesitter.configs')
if not status then
    print('Treesitter Error:' .. tostring(configs) .. '\n')
    return
end

configs.setup({
    ensure_installed = prog_languages,
    sync_install = false,
    auto_install = true,

    highlight = {
	enable = true, 
	additional_vim_regex_highlighting = false,
    },
	    
    indent = { 
	enable = true 
    },
})
