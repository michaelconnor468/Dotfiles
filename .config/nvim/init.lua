require('vimconfigs')
require('keymaps')
require('plugins')

require('onedark').setup { style = 'darker' }
require('onedark').load()

require('config.treesitter')
require('config.nvimtree')
require('config.comment')
require('config.toggleterm')
require('config.telescope')
require('config.autocomplete')
require('config.telescope')
require('config.autopairs')
require('config.lsp')
