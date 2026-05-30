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
    ['CMakeLists.txt'] = true,
}


-- overrides to make file icons purple
local ext_overrides = {}
local file_overrides = {}


local purple = '#B392F0'
local gear_icon = '󰒓'


for ext, default_data in pairs(devicons.get_icons_by_extension()) do
    if target_file_extensions[ext] then
        local icon = default_data.icon
        local name = default_data.name

        if ext == 'cmake' then
            icon = gear_icon
            name = 'CMake'
        end

        ext_overrides[ext] = {
            icon = icon,
            color = purple,
            name = name
        }
    end
end


for fname, default_data in pairs(devicons.get_icons_by_filename()) do
    if target_file_names[fname] then
        icon = default_data.icon
        name = default_data.name

        if fname == 'Makefile' then
            icon = gear_icon
            name = 'Makefile'
        end

        if fname == 'CMakeLists.txt' then
            icon = gear_icon
            name = 'CMakeLists.txt'
        end

        file_overrides[fname] = {
            icon = icon,
            color = purple,
            name = name
        }
    end
end


devicons.setup({
    default = true,
    override = ext_overrides,
    override_by_filename = vim.tbl_extend('force', file_overrides, {
        ['CMakeLists.txt'] = {
            icon = gear_icon,
            color = purple,
            name = 'CMakeLists.txt'
        },
        ['Makefile'] = {
            icon = gear_icon,
            color = purple,
            name = 'CMakeLists.txt'
        },
    })
})
