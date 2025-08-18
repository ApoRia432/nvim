local copilot_enable = true

function toggleCopilot()
    if copilot_enable then
        vim.cmd('Copilot disable')
        print("Copilot disable")
    else
        vim.cmd('Copilot enable')
        print("Copilot enable")
    end
    copilot_enable = not copilot_enable
end

return {
    "github/copilot.vim",
    config = function()
        vim.keymap.set("n", "<leader>cp", toggleCopilot, { desc = "Toggle Copilot" })
        copilot_enable = false
        vim.cmd('Copilot disable')
    end
}
