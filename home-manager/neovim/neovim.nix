{config, pkgs, lib, ...}:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    initLua = builtins.readFile ./init.lua;
    plugins = with pkgs.vimPlugins; [
      FTerm-nvim
      pywal-nvim
      alpha-nvim
      nvim-autopairs
      lualine-nvim
      comment-nvim
      nvim-colorizer-lua
      nvim-lspconfig
      fzf-lua
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp
      nvim-tree-lua
      nvim-lint
      render-markdown-nvim
      twilight-nvim
      which-key-nvim
      gitsigns-nvim
      barbar-nvim
      nvim-treesitter
      catppuccin-nvim
      vim-nix
      nvim-lspconfig
      friendly-snippets
      lualine-nvim
      cmp-nvim-lsp
      nvim-web-devicons
      nvim-cmp
      luasnip
      gruvbox-nvim
      telescope-nvim
      cmp_luasnip
    ];
    extraPackages = with pkgs; [
      gopls
      veridian
      lua-language-server
      rust-analyzer
      cargo
      rustc
      clippy
      rustfmt
      clang-tools
      marksman
      haskellPackages.haskell-language-server
      nil
      pyright
      typescript
    ];
  };
  home.file.".config/nvim/lua/config".source = ./config;
  home.file.".config/nvim/lua/plugins".source = ./plugins;
}
