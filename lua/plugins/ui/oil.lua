return {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = {
        {
            "echasnovski/mini.icons",
            opts = {}
        }
    },
    opts = {
        default_file_explorer = true,
        view_options = {
            show_hidden = true,
        },
    },
}
