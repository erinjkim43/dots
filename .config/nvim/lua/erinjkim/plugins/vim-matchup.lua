return {
	"andymass/vim-matchup",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- Enable Tree-sitter integration
		vim.g.matchup_matchparen_offscreen = {}
	end,
}
