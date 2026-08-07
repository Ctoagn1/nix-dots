{config, lib, pkgs, ...}:
{
  home.file.".config/waybar/context".source = ./context;
  home.file.".config/waybar/config.jsonc".source = ./config.jsonc;
  home.file.".config/waybar/modules.jsonc".source = ./modules.jsonc;
  home.file.".config/waybar/scripts".source = ./scripts;
  home.file.".config/waybar/style.css".source = ./style.css;
  programs.waybar = {
    enable = true;
  };
}    
