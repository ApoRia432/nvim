return {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = {
        messages = {
            enabled = false,
        },
        popmenu = {
            enabled = false,
        },
        notify = {
            enabled = true,
        }
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
}
