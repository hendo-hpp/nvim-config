-- autocomplete.lua
-- https://github.com/saghen/blink.cmp


local status, blink = pcall(require, 'blink.cmp')
if not status then
    return
end


blink.setup({
    keymap = { preset = 'super-tab' },
    signature = { enabled = true },
    sources = {
        default = { 'lsp', 'buffer' },
	providers = {
            lsp = {
                transform_items = function(_, items)
                    return vim.tbl_filter(function(item)
                        return item.kind ~= require('blink.cmp.types').CompletionItemKind.Snippet
                    end, items)
                end,
            },
        },
    },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
    },
})
