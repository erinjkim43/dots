return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	config = function()
		require("mason").setup({
			ensure_installed = {
				-- Language Servers
				"typescript-language-server",
				"lua-language-server",
				"intelephense",
				"tailwindcss-language-server",

				-- Formatters
				"prettier",
				"stylua",
				"pint",
				"isort",
				"black",

				-- Linters
				"eslint_d",
			},
		})

		require("mason-lspconfig").setup()
		require("lspconfig") -- your existing lspconfig setup
	end,
}
