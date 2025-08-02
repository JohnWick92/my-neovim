return {
  "neovim/nvim-lspconfig",
  config = function()
    local vue_language_server_path =
      "/home/shanks/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server/"
    local vue_plugin = {
      name = "@vue/typescript-plugin",
      location = vue_language_server_path,
      languages = { "vue" },
      configNamespace = "typescript",
    }
    local vtsls_config = {
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              vue_plugin,
            },
          },
        },
      },
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    }
    local vue_ls_config = {
      filetypes = { "vue" },
    }
    vim.lsp.config("vtsls", vtsls_config)
    vim.lsp.config("vue_ls", vue_ls_config)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    vim.lsp.config("cssls", {
      capabilities = capabilities,
    })
    local pest_config = {
      filetypes = { "php" },
    }
    vim.lsp.config("pest", pest_config)
    vim.lsp.enable({ "vtsls", "vue_ls", "cssls", "tailwindcss", "intelephense", "sqlls", "pest", "laravel_ls" })
  end,
}
