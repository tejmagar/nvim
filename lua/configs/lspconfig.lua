local configs = require "nvchad.configs.lspconfig"

local servers = {
  html = {},
  awk_ls = {},
  bashls = {},
  rust_analyzer = {
    inlayHints = {
      typeHints = true,
      parameterHints = true,
      chainingHints = true,
    },
    cargo = {
      rustcSource = "/usr/lib/rustlib/src/rust/src",
    }
  },
  clangd = {},
  pylsp = {},
  intelephense = {},
  svelte = {},
  arduino_language_server = {},
  java_language_server = {},
  csharp_ls = {}
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  -- opts.on_attach = configs.on_attach
  opts.on_attach = function(client, bufnr)
    -- Enable diagnostics
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
      }
    )

    vim.lsp.inlay_hint.enable(true)

    if configs and configs.on_attach then
      configs.on_attach(client, bufnr)
    end
  end
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end
