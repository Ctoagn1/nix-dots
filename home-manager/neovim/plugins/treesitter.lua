local configs = require("nvim-treesitter.config")

configs.setup({
    ensure_installed = {
        "bash", "c", "css", "cpp", "go", "html", "java",
        "javascript", "json", "lua", "markdown",
        "markdown_inline", "python", "rust",
        "tsx", "typescript", "haskell",
    },

    highlight = {
        enable = true,
    },

    indent = {
        enable = true,
    },
})