return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main", -- master is frozen; main is an incompatible rewrite (nvim 0.12+, needs tree-sitter CLI)
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		-- autotag no longer hooks into treesitter modules; it sets itself up standalone
		{ "windwp/nvim-ts-autotag", opts = {} },
	},
	config = function()
		local ensure_installed = {
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"prisma",
			"markdown",
			"markdown_inline",
			"svelte",
			"graphql",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"query",
			"vimdoc",
			"c",
			"php",
		}

		-- install() is async and re-checks every parser it's given, so only pass
		-- the ones actually missing to keep startup quiet
		local installed = {}
		for _, lang in ipairs(require("nvim-treesitter.config").get_installed()) do
			installed[lang] = true
		end
		local missing = vim.tbl_filter(function(lang)
			return not installed[lang]
		end, ensure_installed)
		if #missing > 0 then
			require("nvim-treesitter").install(missing)
		end

		-- highlighting + indent are enabled per buffer now; there is no
		-- highlight/indent module anymore
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("erinjkim-treesitter", { clear = true }),
			callback = function(args)
				if not pcall(vim.treesitter.start, args.buf) then
					return -- no parser for this filetype
				end
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		-- incremental selection is built into nvim 0.12: visual `an`/`in` grow
		-- outward/inward, `]n`/`[n` move across siblings
	end,
}
