return {
    settings = {
        pyright = {
            autoImportCompletion = true,
        },
        python = {
            analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "on",
            },
        },
    },
    filetypes = { 'python' },
    root_dir = require('lspconfig.util').root_pattern('pyrightconfig.json')
}
