return {
  "MagicDuck/grug-far.nvim",
  cmd = { "Find", "FindAll", "Replace", "ReplaceAll" },
  config = function()
    require("grug-far").setup({})

    vim.api.nvim_create_user_command("Find", function()
      require("grug-far").open({
        windowCreationCommand = "botright vsplit",
        prefills = { paths = vim.fn.expand("%") },
      })
    end, {})

    vim.api.nvim_create_user_command("FindAll", function()
      require("grug-far").open({
        windowCreationCommand = "botright vsplit",
      })
    end, {})

    vim.api.nvim_create_user_command("Replace", function()
      require("grug-far").open({
        windowCreationCommand = "botright vsplit",
        prefills = { paths = vim.fn.expand("%") },
        transient = true,
      })
    end, {})

    vim.api.nvim_create_user_command("ReplaceAll", function()
      require("grug-far").open({
        windowCreationCommand = "botright vsplit",
        transient = true,
      })
    end, {})
  end,
}
