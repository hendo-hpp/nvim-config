-- options.lua
-- editor behaviour
-- https://neovim.io/doc/user/options/

local editor_options = {
    autoindent = false,

    timeoutlen = 350,    -- time allocated for key map sequence
    ttimeoutlen = 50,    -- time allocated for key code sequence

}

for key, value in pairs(editor_options) do
    vim.opt[key] = value
end
