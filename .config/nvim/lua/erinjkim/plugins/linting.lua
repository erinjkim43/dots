return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
    }

    local eslint_configs = {
      ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json",
      ".eslintrc.yaml", ".eslintrc.yml",
      "eslint.config.js", "eslint.config.mjs", "eslint.config.cjs",
    }

    local function has_eslint_config()
      return vim.fs.find(eslint_configs, {
        upward = true,
        path = vim.fn.expand("%:p:h"),
      })[1] ~= nil
    end

    local function run_lint()
      local linters = lint.linters_by_ft[vim.bo.filetype] or {}
      local filtered = {}
      for _, name in ipairs(linters) do
        if name ~= "eslint_d" or has_eslint_config() then
          table.insert(filtered, name)
        end
      end
      if #filtered > 0 then
        lint.try_lint(filtered)
      end
    end

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = run_lint,
    })

    vim.keymap.set("n", "<leader>l", run_lint, { desc = "Trigger linting for current file" })
  end,
}
