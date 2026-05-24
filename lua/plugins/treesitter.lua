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


local status, ts = pcall(require, 'nvim-treesitter')
if not status then
    print('Treesitter Error:' .. tostring(ts) .. '\n')
    return
end


ts.install(prog_languages)


vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
