vim.opt.guicursor = ""
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 6
vim.opt.winborder = "rounded"
vim.opt.pumborder = "rounded"
vim.opt.hlsearch = false
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.diagnostic.config({
    virtual_text = {
        current_line = true,
    },
})
vim.opt.complete = 'o'
vim.opt.pumheight = 10
vim.opt.completeopt = { "menuone", "noinsert" }
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/completion') then
            client.server_capabilities.completionProvider.triggerCharacters = nil
            client.capabilities.textDocument.completion.completionItem.snippetSupport = true
            vim.lsp.completion.enable(true, client.id, args.buf, {
                autotrigger = true,
                convert = function(item) return { abbr = item.label:gsub('%b()', ''), menu = '', } end,
            })
        end
    end,
})
vim.api.nvim_create_user_command('PackClean', function()
    local plugins = {}
    for _, plugin in ipairs(vim.pack.get()) do
        table.insert(plugins, plugin.spec.name)
    end
    vim.pack.del(plugins)
    vim.cmd.restart()
end, {})
vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/nvim-mini/mini.pick' },
    { src = 'https://github.com/vyfor/cord.nvim' },
    { src = 'https://github.com/projekt0n/github-nvim-theme' },
});
require('mini.pick').setup()
require('cord').setup({
    editor = {
        tooltip = 'Neovim',
        icon = 'https://api.hakush.in/ww/UI/UIResources/Common/Image/IconRoleHead256/T_IconRoleHead256_61_UI.webp',
    },
    text = {
        workspace = function()
            return #vim.pack.get() .. ' plugins installed';
        end,
    },
})

-- keymaps
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>e', vim.cmd.Ex);
vim.keymap.set('n', '<leader>w', vim.cmd.write);
vim.keymap.set('n', '<leader>q', vim.cmd.quit);
vim.keymap.set('n', '<leader>x', vim.cmd.bd);
vim.keymap.set('n', '<leader>t', vim.cmd.term);
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
vim.keymap.set('n', 'grd', vim.lsp.buf.definition);
vim.keymap.set('n', 'gre', vim.diagnostic.open_float);
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format);
vim.keymap.set('n', '<leader>d', function() vim.diagnostic.setqflist({ severity = 1 }) end);
vim.keymap.set('n', '<leader>f', ':Pick files<CR>');
vim.keymap.set('n', '<leader>s', ':Pick grep<CR>');
vim.keymap.set('n', '<leader>b', ':Pick buffers<CR>');
--lsp
vim.lsp.enable('gopls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('bashls')
vim.lsp.enable('yamlls')
vim.lsp.enable('emmet_ls')
vim.cmd("colorscheme github_dark_default")
