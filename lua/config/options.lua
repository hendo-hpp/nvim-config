-- options.lua
-- configurations for editor behaviour
-- https://neovim.io/doc/user/options/



-- global scope options
local global_options = {
    autoindent = false,

    timeoutlen = 350,    -- time allocated for key map sequence
    ttimeoutlen = 50,    -- time allocated for key code sequence

}

for key, value in pairs(global_options) do
    vim.opt[key] = value
end



-- viewport scoped options
local window_options = {
    number = true,
    relativenumber = true,
}

for key, value in pairs(window_options) do
    vim.wo[key] = value
end
