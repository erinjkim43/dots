return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
		"neovim/nvim-lspconfig", -- Ensure LSP is loaded first
	},
	opts = {
		lsp = {
			-- Override markdown rendering for better LSP docs
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			-- Enable beautiful hover windows
			hover = {
				enabled = true,
				silent = true, -- don't show message if hover not available
			},
			-- Enable signature help
			signature = {
				enabled = true,
				auto_open = {
					enabled = true,
					trigger = true,
					luasnip = true,
					throttle = 50,
				},
			},
			-- Reduce LSP progress noise
			progress = {
				enabled = true,
				format = "lsp_progress",
				format_done = "lsp_progress_done",
				throttle = 1000 / 30, -- frequency to update lsp progress message
				view = "mini",
			},
		},
		-- You can enable a preset for easier configuration
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		-- Configure specific routes for different message types
		routes = {
			-- Hide "written" messages when saving files
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
			-- Route long messages to split
			{
				filter = { event = "msg_show", min_height = 20 },
				view = "split",
			},
			-- Route search to mini view
			{
				filter = { event = "msg_show", kind = "search_count" },
				opts = { skip = true },
			},
			-- Skip LSP progress messages that can cause loops
			{
				filter = {
					event = "lsp",
					kind = "progress",
				},
				opts = { skip = true },
			},
			-- Skip hover messages that can cause conflicts
			{
				filter = {
					event = "msg_show",
					find = "No information available",
				},
				opts = { skip = true },
			},
		},
		-- Configure views
		views = {
			cmdline_popup = {
				position = {
					row = 5,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = 8,
					col = "50%",
				},
				size = {
					width = 60,
					height = 10,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
	},
}