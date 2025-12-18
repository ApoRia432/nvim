vim.opt.mouse = ""
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
-- auto completion
vim.opt.complete = 'o'
vim.opt.pumheight = 10
vim.opt.completeopt = { "menuone", "noinsert" }
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/completion') then
            -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            client.server_capabilities.completionProvider.triggerCharacters = nil
            vim.lsp.completion.enable(true, client.id, args.buf, {
                autotrigger = true,
                convert = function(item)
                    return {
                        abbr = item.label:gsub('%b()', ''),
                        menu = '',
                    }
                end,
            })
        end
    end,
})

vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter',    version = 'main' },
    { src = 'https://github.com/stevearc/oil.nvim' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
    { src = 'https://github.com/nvim-mini/mini.pick' },
    { src = 'https://github.com/folke/tokyonight.nvim' },
});
local inactive_plugins = vim.iter(vim.pack.get())
	:filter(function(x) return not x.active end)
	:map(function(x) return x.spec.name end)
	:totable()
if #inactive_plugins > 0 then
    vim.pack.del(inactive_plugins);
end

require('gitsigns').setup()
require('mini.pick').setup()
require('oil').setup({
    view_options = {
        show_hidden = true,
    },
    win_options = {
        winbar = "%#@attribute.builtin#%{substitute(v:lua.require('oil').get_current_dir(), '^' . $HOME, '~', '')}",
    },
})
-- treesitter
require('nvim-treesitter').install('lua', 'go', 'vue', 'html', 'svelte', 'scss', 'css', 'typescript', 'javascript',
    'typescriptreact', 'javascriptreact');
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'lua', 'go', 'vue', 'html', 'scss', 'css', 'svelte', 'typescript', 'javascript', 'tsx', 'jsx' },
    callback = function() vim.treesitter.start() end,
})

-- keymaps
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>e', vim.cmd.Oil);
vim.keymap.set('n', '<leader>w', vim.cmd.write);
vim.keymap.set('n', '<leader>q', vim.cmd.quit);
vim.keymap.set('n', '<leader>x', vim.cmd.bd);
vim.keymap.set('n', '<leader>t', vim.cmd.term);
vim.keymap.set('n', '<leader>d', function() vim.diagnostic.setqflist({ severity = 1 }) end);

vim.keymap.set('n', 'grd', vim.lsp.buf.definition);
vim.keymap.set('n', 'gre', vim.diagnostic.open_float);
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format);
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')

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
-- colorscheme
vim.cmd('colorscheme tokyonight-night');
