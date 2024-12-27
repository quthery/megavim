---@diagnostic disable: undefined-global
return {
  {
    "williamboman/mason.nvim",
    config = function()
    require('mason').setup()
  end
},
{
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "pyright", "clangd", "eslint", "ts_ls", "html", "cssls" }
      })
    end
},
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilites = capabilities,

        settings = {
          Lua = {
            completion = {
              callSnippet = "Both",
            },
            diagnostics = {
              disable = { "incomplete-signature-doc", "missing-fields" },
              -- You could add more globals i.e., "vim" here, albeit w/o intellisense
              globals = { "MiniMap" },
            },
            hint = {
              enable = true,
              arrayIndex = "Disable",
            },
            telemetry = { enable = false },
            chcekThirdParty = false,
            library = {
              -- Make the server aware of Neovim runtime files
              -- vim.fn.expand('$VIMRUNTIME/lua'),
              -- vim.fn.stdpath('config') .. '/lua'
            },
          },
        },
      })
      lspconfig.gopls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {"gopls"},
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      }
      vim.keymap.set("n", 'K', vim.lsp.buf.hover, {})
      vim.keymap.set("n", 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, '<leader>ca', vim.lsp.buf.code_action, {})

    end
  }
}
