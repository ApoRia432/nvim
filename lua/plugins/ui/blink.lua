return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
        keymap = {
            preset = "default",
            ["<S-Tab>"] = { "select_prev", "fallback_to_mappings" },
            ["<Tab>"] = { "select_next", "fallback_to_mappings" },
            ["<CR>"] = { "accept", "fallback" },
        },
        completion = {
            ghost_text = {
                enabled = false,
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
            },
        },
        sources = {
            default = { "lsp", "path" },
            providers = {
                lsp = { fallbacks = {} },
            },
        },
        signature = {
            enabled = true,
            window = {
                show_documentation = false,
            }
        }
    },
    opts_extend = { "sources.default" },
}
