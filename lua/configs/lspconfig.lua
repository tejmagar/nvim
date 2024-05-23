local configs = require "nvchad.configs.lspconfig"

local servers = {
  html = {},
  awk_ls = {},
  bashls = {},
  rust_analyzer = {},
  clangd = {},
  pylsp = {},
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  -- opts.on_attach = configs.on_attach
  opts.on_attach = function(client, bufnr)
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Enable diagnostics
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics, {
              update_in_insert = true,
          }
      )

      if configs and configs.on_attach then
          configs.on_attach(client, bufnr)
      end
  end
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end
