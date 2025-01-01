return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>f", builtin.find_files, {})
			vim.keymap.set("n", "<leader>tl", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>t", vim.cmd.Telescope, {})
			vim.keymap.set("n", "<leader>th", builtin.colorscheme, {})
			vim.keymap.set("n", "<leader>tg", builtin.git_status, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				require("telescope").load_extension("ui-select"),
			})
		end,
	},
}
