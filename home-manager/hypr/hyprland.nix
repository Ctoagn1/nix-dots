{config, pkgs, lib, ...}: 
{
    imports = [
    ./autostart.nix
    ./binds.nix
    ./decorations.nix
    ./input.nix
    ./rules.nix
    ./animations.nix
  ];
  wayland.windowManager.hyprland.settings.config = {
    misc = {
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
        disable_splash_rendering = false;
    };
    master = {
        new_status = "master";
    };
    scrolling = {
        fullscreen_on_one_column = true;
    };
    dwindle = {
        preserve_split = true;
    };
  };
}
