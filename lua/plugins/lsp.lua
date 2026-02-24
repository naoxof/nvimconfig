return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "lua_ls" },
      })

      -- lua_ls: Neovim設定ファイル向けの設定
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })
      vim.lsp.enable({ "lua_ls", "ts_ls" })

      -- 補完の表示設定
      vim.o.completeopt = "menuone,noinsert,popup"

      -- LSPアタッチ時のキーマップ
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

          -- LSP自動補完を有効化（autotrigger = true で入力中に自動表示）
          vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })

          -- Ctrl+Space で手動補完トリガー
          vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", opts)
        end,
      })
    end,
  },
}
