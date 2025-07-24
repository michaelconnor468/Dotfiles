local modules_to_load = {
    'vimconfigs',
    'keymaps',
    'plugins',
    'config.treesitter',
    'config.nvimtree',
    'config.comment',
    'config.toggleterm',
    'config.telescope',
    'config.autocomplete',
    'config.telescope',
    'config.autopairs',
    'config.lsp',
    'config.blamer',
    'config.hop',
    'config.neogit'
}

for _, module in ipairs(modules_to_load) do
    local ok, _ = pcall(require, module)
end

if vim.fn.has "mac" == 0 then
    require('onedark').setup { 
        style = 'darker',
        colors = {
            bg = '#141412',
            bg0 = '#141412',
            bg1 = '#141412',
            bg2 = '#2f2f2f',
            bg_d = '#141412'
        }
    }
end
require('onedark').load()

vim.cmd('set runtimepath+=/home/james/Projects/vim')
