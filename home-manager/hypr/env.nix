{config, lib, pkgs, ...}:
{
  wayland.windowManager.hyprland.settings = {
    env = [
      "HYPRCURSOR_THEME,Graphite"
      "HYPRCURSOR_SIZE,24"
      "XCURSOR_THEME,Graphite"
      "XCURSOR_SIZE,24"
    ];
  };
}
