-- autocomplete.lua
-- https://github.com/saghen/blink.cmp


local status, blink = pcall(require, 'blink.cmp')
if not status then
    return
end


blink.setup({
    keymap = { 
        preset = 'super-tab' -- tab selects the completion object
    },

    signature = { 
        enabled = true -- show function arguments
    },

    sources = {
        default = { 
            'lsp',   -- get suggestions from active lsp
            --'buffer' -- get suggestions from all words in current buffer
        },
	    providers = {
            lsp = {
                -- hide code snippet completion items
                transform_items = function(_, items)
                    return vim.tbl_filter(function(item)
                        return item.kind ~= require('blink.cmp.types').CompletionItemKind.Snippet
                    end, items)
                end,
            }, 
        },
    },

    appearance = {
        use_nvim_cmp_as_default = true, -- fallback incase treesitter highlighting fails
        nerd_font_variant = 'mono',     -- consistent text width in completion window
    },
})
