-- filetree.lua
-- https://github.com/nvim-tree/nvim-tree.lua

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then
    return
end


nvim_tree.setup({
    sort = {
        sorter = 'case_sensitive',
    },
    view = {
        width = 30,
        side = 'left',
    },
    renderer = {
        group_empty = true,
        icons = {
            webdev_colors = true,
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
    },
    filters = {
        dotfiles = false,
    },
})
