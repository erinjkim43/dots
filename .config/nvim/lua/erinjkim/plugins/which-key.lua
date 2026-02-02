return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    spec = {
      { "<leader>e", group = "explorer" },
      { "<leader>f", group = "find" },
      { "<leader>g", group = "git" },
      { "<leader>h", group = "git hunks" },
      { "<leader>s", group = "session/split" },
      { "<leader>t", group = "tabs/toggle" },
      { "<leader>x", group = "trouble" },
    },
  },
}
