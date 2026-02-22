return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install({
            "markdown", "markdown_inline",
            "swift", "typescript", "javascript",
            "html", "css", "python", "lua",
        })
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("treesitter-start", {}),
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
