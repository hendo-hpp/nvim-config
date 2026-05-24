-- markdown.lua
-- https://github.com/MeanderingProgrammer/render-markdown.nvim


local status, render_markdown = pcall(require, 'render-markdown')
if not status then
    return
end


render_markdown.setup({
    heading = {
        enabled = true,
        sign = false,
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
    },
    code = {
        enabled = true,
        style = 'full',
        left_pad = 2,
        right_pad = 4,
        highlight = 'NormalFloat',
    },
    bullet = {
        enabled = true,
        icons = { '●', '○', '◆', '◇' },
    },
})
