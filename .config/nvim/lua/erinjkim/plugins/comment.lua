-- commenting itself is built into nvim 0.10+ (gc/gcc); ts-comments only
-- fixes commentstring per treesitter node (tsx/jsx/svelte/html/blade etc.),
-- replacing Comment.nvim + nvim-ts-context-commentstring
return {
	"folke/ts-comments.nvim",
	event = "VeryLazy",
	opts = {},
}
