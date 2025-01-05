---@diagnostic disable: undefined-global
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"pyright",
					"clangd",
          "jsonls",
					"eslint",
					"ts_ls",
					"html",
					"cssls",
					"ruff",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			ensure_installed =
				{

					{ "golangci-lint", version = "v1.47.0" },

					-- you can turn off/on auto_update per tool
					{ "bash-language-server", auto_update = true },

					"lua-language-server",
					"vim-language-server",
					"gopls",
					"stylua",
					"shellcheck",
					"editorconfig-checker",
					"gofumpt",
					"golines",
					"gomodifytags",
					"gotests",
					"impl",
					"json-to-struct",
					"luacheck",
					"misspell",
					"revive",
					"shellcheck",
					"shfmt",
					"staticcheck",
					"vint",
				},
				auto_update == false,
				run_on_start == true,
				start_delay == 3000, -- 3 second delay
				debounce_hours == 5, -- at least 5 hours between attempts to install/update
				integrations == {
					["mason-lspconfig"] = true,
					["mason-null-ls"] = true,
					["mason-nvim-dap"] = true,
				}
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities_lsp = require("cmp_nvim_lsp").default_capabilities()
			lspconfig.pyright.setup({
				on_attach = on_attach,
        capabilites = capabilities_lsp,
				settings = {
					pyright = { autoImportCompletion = true },
					python = {
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = "openFilesOnly",
							useLibraryCodeForTypes = true,
							typeCheckingMode = "off",
						},
					},
				},
			})

			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilites = capabilities_lsp,
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
      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities_lsp,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_dir = lspconfig.util.root_pattern("tsconfig.json", "package.json", ".git"),
      })
			lspconfig.gopls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = { "gopls" },
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
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
