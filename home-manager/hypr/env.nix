{config, lib, pkgs, ...}:
let
  envf = key: value: {
    _args = [
      key
      value
    ];
  };
in
{
  wayland.windowManager.hyprland.settings = {
    env = [
      (envf "NIXOS_OZONE_WL" "1")
    ];
  };

}

