{config, lib, pkgs, ...}:
{
  home.file.".config/waybar/context".source = ./context;
  home.file.".config/waybar/config.jsonc".source = ./config.jsonc;
  home.file.".config/waybar/modules.jsonc".source = ./config.jsonc;
  home.file.".config/waybar/scripts".source = ./scripts;
  programs.waybar = {
    enable = true;
  };
}    
