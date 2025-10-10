local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup({})

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
