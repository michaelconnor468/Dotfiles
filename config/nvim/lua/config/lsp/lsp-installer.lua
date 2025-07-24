local ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not ok then
    print('Could not procure lsp-installer')
    return
end

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require('config.lsp.handlers').on_attach,
        capabilities = require('config.lsp.handlers').capabilities
    }

    if server.name == 'jsonls' then
        local jsonls_opts = require('config.lsp.settings.jsonls')
        opts = vim.tbl_deep_extend('force', jsonls_opts, opts)
    end
    
    if server.name == 'hls' then
        local hls_opts = require('config.lsp.settings.hls')
        opts = vim.tbl_deep_extend('force', hls_opts, opts)
    end

    server:setup(opts)
end)
