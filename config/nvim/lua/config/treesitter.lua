local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
    print('Failed to procure treesitter')
    return
end

configs.setup {
    ensure_installed = {'python', 'lua', 'java', 'kotlin', 'c', 'cpp', 'javascript', 'typescript'},
    sync_install = false,
    auto_install = true
    ignore_installl = {},
    highlight = {
        enable = true, -- enables whole extension
    },
    indent = {
        enable = true, 
    },
    additional_vim_regex_highlighting = false
}
