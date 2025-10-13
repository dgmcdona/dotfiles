return {
  awk_ls = {},
  clangd = {},
  gopls = {},
  taplo = {},
  sqlls = {},
  jsonls = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
        extra = {
          {
            description = "Volatility3 VType Schema",
            fileMatch = "callbacks-x64.json",
            name = "schema-6.2.0.json",
            url = "file:///Users/dmcdonald/volatility3/volatility3/schemas/schema-6.2.0.json",
          },
        },
      },
    },
  },
  basedpyright = require("river_rat.extras.lang_servers.pyright"),
  rust_analyzer = {
    settings = {
      cargo = {
        allFeatures = true,
        loadOutDirsFromCheck = true,
        runBuildScripts = true,
      },
      -- Add clippy lints for Rust.
      checkOnSave = {
        allFeatures = true,
        command = "clippy",
        extraArgs = {
          "--",
          "--no-deps",
          "-Dclippy::correctness",
          "-Dclippy::complexity",
          "-Wclippy::perf",
          "-Wclippy::pedantic",
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
}
