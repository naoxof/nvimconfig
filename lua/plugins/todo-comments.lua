return {
  "folke/todo-comments.nvim",
  cond = function() return not vim.g.vscode end,
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {},
}
