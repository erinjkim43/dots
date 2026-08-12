return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	-- release tags ship the prebuilt rust fuzzy matcher; no build step needed
	version = "1.*",
	dependencies = {
		"rafamadriz/friendly-snippets", -- useful snippets, expanded via native vim.snippet
	},
	opts = {
		keymap = {
			-- "enter" preset: <CR> accept, <C-space> show menu/docs, <C-e> hide,
			-- <C-b>/<C-f> scroll docs — same as the old nvim-cmp setup
			preset = "enter",
			["<C-k>"] = { "select_prev", "fallback" }, -- previous suggestion
			["<C-j>"] = { "select_next", "fallback" }, -- next suggestion
		},
		appearance = {
			nerd_font_variant = "normal",
		},
		completion = {
			accept = { auto_brackets = { enabled = true } }, -- parens after accepting functions
			documentation = { auto_show = true, auto_show_delay_ms = 200 },
			-- match old completeopt=noselect behavior: nothing preselected
			list = { selection = { preselect = false, auto_insert = true } },
		},
		sources = {
			default = { "lsp", "blade-nav", "path", "snippets", "buffer" },
			providers = {
				["blade-nav"] = {
					name = "blade-nav",
					module = "blade-nav.integrations.blink",
				},
			},
		},
		signature = { enabled = true },
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
