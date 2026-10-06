require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
				border = "rounded",
				source = "always",
		},
})
-- Lua
vim.lsp.config("lua_ls", {capabilities = capabilities})
vim.lsp.enable("lua_ls")

-- Nix
vim.lsp.config("nil_ls", {capabilities = capabilities})
vim.lsp.enable("nil_ls")
-- Rust
vim.lsp.config("rust_analyzer", {capabilities = capabilities})
vim.lsp.enable("rust_analyzer")
-- C/C++
vim.lsp.config("clangd", {capabilities = capabilities})
vim.lsp.enable("clangd")
-- Python
vim.lsp.config("pyright", {capabilities = capabilities})
vim.lsp.enable("pyright")
-- Go
vim.lsp.config("gopls", {capabilities = capabilities})
vim.lsp.enable("gopls")
-- SystemVerilog
vim.lsp.config("veridian", {capabilities = capabilities})
vim.lsp.enable("veridian")

vim.lsp.config("verible", {capabilities = capabilities})
vim.lsp.enable("verible")
-- Markdown
vim.lsp.config("marksman", {capabilities = capabilities})
vim.lsp.enable("marksman")
-- Haskell
vim.lsp.config("hls", {capabilities = capabilities})
vim.lsp.enable("hls")
-- Ts/Javascript
vim.lsp.config("tsc", {capabilities = capabilities})
vim.lsp.enable("tsc")
