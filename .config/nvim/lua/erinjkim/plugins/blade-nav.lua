return {
	"ricardoramirezr/blade-nav.nvim",
	-- completion is provided through the blade-nav source registered in blink.cmp
	ft = { "blade", "php" }, -- optional, improves startup time
	opts = {
		close_tag_on_complete = true, -- default: true
		integrations = {
			-- both default to true and warn when the plugin is absent; blink.cmp
			-- is the only completion engine here, so leave them off
			cmp = false,
			coq = false,
		},
	},
}
