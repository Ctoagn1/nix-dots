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

    ];
  };

}

