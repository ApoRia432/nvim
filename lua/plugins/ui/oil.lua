function _G.get_oil_winbar()
    local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
    local dir = require("oil").get_current_dir(bufnr)
    if dir then
        return vim.fn.fnamemodify(dir, ":~")
    else
        -- If there is no current directory (e.g. over ssh), just show the buffer name
        return vim.api.nvim_buf_get_name(0)
    end
end

vim.api.nvim_create_autocmd("User", {
    pattern = "OilEnter",
    callback = vim.schedule_wrap(function(args)
        local oil = require("oil")
        if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
            oil.open_preview()
        end
    end),
})

return {
    "benomahony/oil-git.nvim",
    dependencies = {
        {

            'stevearc/oil.nvim',
            lazy = false,
            dependencies = {
                "echasnovski/mini.icons",
            },
            opts = {
                default_file_explorer = true,
                columns = {
                    "icon",
                },
                reverse_columns = true,
                win_options = {
                    winbar = "%!v:lua.get_oil_winbar()",
                },
                view_options = {
                    show_hidden = true,
                },
            },
        }
    }
}
