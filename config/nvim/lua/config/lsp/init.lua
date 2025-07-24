require('config.lsp.mason')

local handlers = require('config.lsp.handlers')
handlers.setup()

local ok, lsp = pcall(require, 'lspconfig')
if not ok then
    print('Could not procure lsp')
    return
end

require('config.lsp.settings.lua')
