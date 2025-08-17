return {
    "xiyaowong/transparent.nvim",
    config = function()
        local transparent = require("transparent")
        transparent.setup({
            groups = {
                "Normal",
                "NormalNC",
                "Comment",
                "Constant",
                "Special",
                "Identifier",
                "Statement",
                "PreProc",
                "Type",
                "Underlined",
                "Todo",
                "String",
                "Function",
                "Conditional",
                "Repeat",
                "Operator",
                "Structure",
                "LineNr",
                "NonText",
                "SignColumn",
                "CursorLine",
                "CursorLineNr",
                "StatusLine",
                "StatusLineNC",
                "EndOfBuffer",
            },
            extra_groups = {
                "NormalFloat",
                "Pmenu",
                "Float",
                "BufferLine"
            },
            exclude_groups = {},
            on_clear = function() end,
        })
        transparent.clear_prefix("Buffer")
        transparent.clear_prefix("BufferLine")
        transparent.clear_prefix("NeoTree")
        transparent.clear_prefix("NvimTree")
        transparent.clear_prefix("Telescope")

        vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "ExtraGroup" })

        vim.keymap.set("n", "<leader>tp", vim.cmd.TransparentToggle)
    end,
}
