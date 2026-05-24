-- tabbar.lua
-- https://github.com/romgrk/barbar.nvim


local status, barbar = pcall(require, 'barbar')
if not status then
    return
end


barbar.setup({
    animation = true,
    auto_hide = false,
    tabpages = true, 
    closable = true,
    focus_on_close = 'left',
    clickable = true,
    
    icons = {
        buffer_index = false,
	buffer_number = false,
	button = '',
	inactive = { 
	    button = '', 
	},
	seperator = {
	    left = '|',
	    right = '',
	},
	
    },

    exclude_ft = {
        'NvimTree'
    },
})
