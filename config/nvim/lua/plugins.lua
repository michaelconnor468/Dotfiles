local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    }
    vim.cmd 'packadd packer.nvim'
end

local ok, packer = pcall(require, 'packer')
if not ok then
    print('unable to require packer')
    return
end

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'navarasu/onedark.nvim'

    -- Language parser must be updated as well with new treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    use 'hrsh7th/cmp-nvim-lsp'

    use 'windwp/nvim-autopairs'
    use 'numToStr/Comment.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'mfussenegger/nvim-jdtls'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'

    use 'kyazdani42/nvim-web-devicons'
    use { 'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons' }

    use 'akinsho/toggleterm.nvim'
    
    use 'APZelos/blamer.nvim'
    use 'phaazon/hop.nvim'
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
end)
