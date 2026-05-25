-- icons.lua
-- https://github.com/nvim-tree/nvim-web-devicons


local status, devicons = pcall(require, 'nvim-web-devicons')
if not status then
    return
end


local target_file_extensions = {
    asm = true, s = true,
    sh = true, bash = true,
    c = true, h = true,
    cmake = true,
    cpp = true, hpp = true, cc = true, cxx = true,
    cu = true,
    hs = true,
    java = true,
    js = true, jsx = true,
    json = true,
    lua = true,
    md = true, markdown = true,
    py = true,
    rs = true,
    ts = true, tsx = true,
}


local target_file_names = {
    ['.gitignore'] = true,
    ['.gitattributes'] = true,
    ['Makefile'] = true,
}


-- overrides to make file icons purple
local ext_overrides = {}
local file_overrides = {}


local purple = '#B392F0'


for ext, default_data in pairs(devicons.get_icons_by_extension()) do
    if target_file_extensions[ext] then
        ext_overrides[ext] = {
            icon = default_data.icon,
            color = purple,
            name = default_data.name
        }
    end
end


for fname, default_data in pairs(devicons.get_icons_by_filename()) do
    if target_file_names[fname] then
        file_overrides[fname] = {
            icon = default_data.icon,
            color = purple,
            name = default_data.name
        }
    end
end


devicons.setup({
    default = true,
    override = ext_overrides,
    override_by_filename = file_overrides,
})
