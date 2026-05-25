-- fuzzyfinder.lua
-- https://github.com/ibhagwan/fzf-lua


local status, fzf_lua = pcall(require, 'fzf-lua')
if not status then
   return
end


fzf_lua.setup({
    winopts = {
        height = 0.85,
	    width = 0.85,
	    preview = {
	        horizontal = 'right:50%',
            layout = 'flex',
	    },
    },
})
