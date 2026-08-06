{config, lib, pkgs, ...}:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    presets = [
      "gruvbox-rainbow"
    ];
    settings = {
      add_newline = true;

    };
  }
}
