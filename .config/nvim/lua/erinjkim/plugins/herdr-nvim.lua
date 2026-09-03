-- Annotations half of the herdr-nvim plugin: comment lines like a code review,
-- then send them to an agent running in the herdr workspace with file:line and
-- git context. The sidebar and file picker halves live in the herdr plugin
-- (herdr plugin install ChmaraX/herdr-nvim), bound to prefix+e and prefix+o.
--
-- Prefix is <leader>v, not the upstream default <leader>a, because harpoon
-- already owns <leader>a for marking files.
--
-- keymaps = false and the explicit maps below are deliberate. The sidebar
-- daemon re-requires this module on VimEnter and calls setup() with no
-- arguments. With the plugin's own keymaps enabled, that second call finds the
-- maps already set and emits five WARN notifications, which flash in the
-- sidebar on every toggle. Setting them here instead makes the daemon's call a
-- silent no-op.
return {
	"ChmaraX/herdr-nvim",
	-- Load inside any herdr pane, including the plugin-spawned sidebar daemon.
	cond = function()
		return vim.env.HERDR_ENV ~= nil
			or vim.env.HERDR_TAB_ID ~= nil
			or vim.env.HERDR_PANE_ID ~= nil
	end,
	opts = {
		prefix = "<leader>v",
		keymaps = false,
	},
	config = function(_, opts)
		local herdr = require("herdr-nvim")
		herdr.setup(opts)

		local map = vim.keymap.set
		local p = opts.prefix
		map("x", p .. "c", function()
			herdr.comment_selection()
		end, { desc = "herdr-nvim: comment selection" })
		map("n", p .. "c", function()
			herdr.comment_line()
		end, { desc = "herdr-nvim: comment line" })
		map("n", p .. "l", function()
			herdr.list_comments()
		end, { desc = "herdr-nvim: list comments" })
		map("n", p .. "s", function()
			herdr.send_all({ submit = false })
		end, { desc = "herdr-nvim: paste comments to agent" })
		map("n", p .. "S", function()
			herdr.send_all({ submit = true })
		end, { desc = "herdr-nvim: send comments to agent" })
	end,
}
