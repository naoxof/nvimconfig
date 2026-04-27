return {
  "petertriho/nvim-scrollbar",
  cond = function() return not vim.g.vscode end,
  event = "BufReadPost",
  opts = {},
}
