return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>a", mark.add_file, { desc = "Mark file with harpoon" })
		keymap.set("n", "<C-p>", ui.toggle_quick_menu, { desc = "Show marked files" })

		keymap.set("n", "<leader>h", function()
			ui.nav_file(1)
		end, { desc = "Go to file 1" })
		keymap.set("n", "<leader>j", function()
			ui.nav_file(2)
		end, { desc = "Go to file 2" })
		keymap.set("n", "<leader>k", function()
			ui.nav_file(3)
		end, { desc = "Go to file 3" })
		keymap.set("n", "<leader>l", function()
			ui.nav_file(4)
		end, { desc = "Go to file 4" })
	end,
}
