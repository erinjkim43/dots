return {
	"tpope/vim-fugitive",
	cmd = { "Git", "G" },
	keys = {
		{ "<leader>gg", "<cmd>Git<cr>", desc = "Git status" },
		{ "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
		{ "<leader>gl", "<cmd>Git pull<cr>", desc = "Git pull" },
		{ "<leader>gB", "<cmd>Git blame<cr>", desc = "Git blame" },
	},
}
