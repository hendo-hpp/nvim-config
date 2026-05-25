-- theme.lua


local theme_utils = {}


-- themes installed/created by user
theme_utils.themes = { 
    'ghdark',
}


-- called on keymap <leader>th to switch between specified themes
function theme_utils.cycle_themes()
    local current = vim.g.colors_name or 'default'
    local next_th = theme_utils.themes[1]

    for idx, theme in ipairs(theme_utils.themes) do
	if theme == current then
	    local next_idx = (idx % #theme_utils.themes) + 1
	    next_th = theme_utils.themes[next_idx]
	    break
        end
    end

    pcall(vim.cmd, 'colorscheme ' .. next_th)
end


return theme_utils
