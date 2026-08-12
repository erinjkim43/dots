return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	opts = {
		check_ts = true, -- enable treesitter
		ts_config = {
			lua = { "string" }, -- don't add pairs in lua string treesitter nodes
			javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
			java = false, -- don't check treesitter on java
		},
	},
	-- the old nvim-cmp confirm_done hook is gone; blink.cmp's built-in
	-- auto_brackets handles parens after accepting a completion
}
