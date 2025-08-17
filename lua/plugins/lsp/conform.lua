return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "goimports", "gofmt" },
                markdown = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                json = { "prettier" },
                vue = { "prettier" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
            },
            format_on_save = {
                timeout_ms = 5000,
                lsp_format = "fallback",
            },
        })
    end,
}
