-- options.lua
-- configurations for editor behaviour
-- https://neovim.io/doc/user/options/


-- global scope options
local global_options = {
    autoindent = true,  -- keep indent from current line when making a new one
    smartindent = true, -- insert indents for different blocks such as after {
    tabstop = 4,        -- spaces per tab 
    shiftwidth = 4,     -- spaces per autoindent
    softtabstop = 4,    -- spaces per tabs (while editing)
    expandtab = true,   -- convert tabs to spaces

    wrap = true,         -- text will overflow to next line if too long
    smoothscroll = true, -- dont jump over overflowed text
    scrolloff = 8,       -- keep padding of 8 when scrolling 

    signcolumn = 'yes', -- always keep left column for signs as active

    showmode = false, -- mode not needed as shown by status line

    splitright = true, -- default opening new buffers rightwards
    splitbelow = true, -- default opening new buffers downwards

    ignorecase = true, -- ignore casing in search patterns
    smartcase = true,  -- do not ignore casing if search pattern has explicitly typed capitals

    updatetime = 250,    -- time to write to swap in case of crash
    timeoutlen = 350,    -- time allocated for key map sequence
    ttimeoutlen = 50,    -- time allocated for key code sequence

}


for key, value in pairs(global_options) do
    vim.opt[key] = value
end


-- viewport scoped options
local viewport_options = {
    number = true,
    relativenumber = true,
}


for key, value in pairs(viewport_options) do
    vim.wo[key] = value
end
