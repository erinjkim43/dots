return {
	{
		"tpope/vim-fugitive",
		config = function()
			-- set keymaps
			local keymap = vim.keymap -- for conciseness
			keymap.set("n", "<leader>G", ":G<CR>") -- git status
		end,
	},
}
