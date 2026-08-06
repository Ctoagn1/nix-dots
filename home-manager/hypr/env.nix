{config, lib, pkgs, ...}:
let
  env = key: value: {
    _args = [
      key
      value
    ];
  };
in
{
  wayland.windowManager.hyprland.settings = {
    env = [
      (env "HYPRCURSOR_THEME" "Graphite")
      (env "HYPRCURSOR_SIZE" "24")
      (env "XCURSOR THEME" "Graphite")
      (env "XCURSOR_SIZE" "24")
    ];
  };
}
