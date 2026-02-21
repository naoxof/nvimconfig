return {
  {
    "smoka7/hop.nvim",
    config = function()
      -- hop.nvim の基本的な設定
      local hop = require('hop')
      hop.setup({
        keys = 'etovxqpdygfblzhckisuran', -- 使用するキーの順序をカスタマイズできます
      })

      -- キーバインドの設定
      vim.api.nvim_set_keymap(
        'n', '<Leader>w', ":HopWord<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        'n', '<Leader>p', ":HopPattern<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        'n', '<Leader>l', ":HopLineStart<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        'n', '<Leader>c', ":HopChar1<CR>",
        { noremap = true, silent = true }
      )
    end,
  }
}
