return {
  "folke/snacks.nvim",
  lazy=false,
  keys = {
    { "<leader>s", function() Snacks.explorer() end, desc = "Explorer (sidebar)" },
    { "<leader><leader>", function() Snacks.picker.smart() end, desc = "Smart Find Files" }
  },
  opts = {
    explorer = {
        replace_netrw = true, -- Replace netrw with the snacks explorer
        trash = true, -- Use the system trash when deleting files
    },
    picker = {
    }
  }
}
