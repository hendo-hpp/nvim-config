-- colors/hendo.lua


set_hl = vim.api.nvim_set_hl


-- clear highlights
vim.cmd('hi clear')
if vim.fn.exists('syntax_on') == 1 then
    vim.cmd('syntax reset')
end

-- theme name
vim.g.colors_name = 'ghdark'


-- color palette
local bg         = '#24292E' -- background
local fg         = '#E1E4E8' -- local variables / default text
local orange     = '#FFAB70' -- parameters
local red        = '#F97583' -- keywords / operators
local purple     = '#B392F0' -- function names
local blue       = '#79B8FF' -- constants / preprocessor macros
local light_blue = '#9ECBFF' -- strings
local gray       = '#6A737D' -- comments

local visual_select = '#2B323A' -- highlight
local float_bg      = '#1F2428' -- floating panel background

-- editor UI settings
set_hl(0, 'Normal',      { fg = fg, bg = bg })
set_hl(0, 'Visual',      { bg = visual_select }) 
set_hl(0, 'LineNr',      { fg = gray })
set_hl(0, 'CursorLineNr',{ fg = purple, bold = true })
set_hl(0, 'NormalFloat', { fg = fg, bg = float_bg }) 
set_hl(0, 'FloatBorder', { fg = gray, bg = float_bg })

-- fallback for treesitter failure 
set_hl(0, 'Comment',     { fg = gray, italic = true })
set_hl(0, 'Constant',    { fg = blue })
set_hl(0, 'String',      { fg = light_blue })
set_hl(0, 'Identifier',  { fg = fg })
set_hl(0, 'Function',    { fg = purple })
set_hl(0, 'Statement',   { fg = red })
set_hl(0, 'Operator',    { fg = red })
set_hl(0, 'PreProc',     { fg = red }) 
set_hl(0, 'Type',        { fg = red })
set_hl(0, 'Special',     { fg = purple })

-- treesitter override
set_hl(0, '@comment',           { link = 'Comment' })
set_hl(0, '@variable',          { fg = fg })         
set_hl(0, '@variable.parameter',{ fg = orange })     
set_hl(0, '@keyword',           { fg = red })        
set_hl(0, '@keyword.directive', { fg = red })        
set_hl(0, '@operator',          { fg = red })  
set_hl(0, '@function',          { fg = purple })    
set_hl(0, '@function.call',     { fg = purple })    
set_hl(0, '@constant',          { fg = blue })
set_hl(0, '@string',            { fg = light_blue })
set_hl(0, '@type',              { fg = red })
set_hl(0, '@function.builtin',  { fg = purple })
set_hl(0, '@type.builtin',      { fg = red })
set_hl(0, '@constant.builtin',  { fg = blue })
set_hl(0, '@lsp.type.comment', {})
