return {
    settings = {
        pyright = {
            autoImportCompletion = true,
        },
        python = {
            analysis = {
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "on",
            },
        },
    },
    filetypes = { 'python' },
    root_dir = require('lspconfig.util').root_pattern('pyrightconfig.json')
}
