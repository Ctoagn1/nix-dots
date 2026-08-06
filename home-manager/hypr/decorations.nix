{config, pkgs, lib, ...}:
{
    wayland.windowManager.hyprland = {
        settings = {
            config = {
                general = {
                    gaps_in = 8;
                    gaps_out = 20;

                    border_size = 1;

                    resize_on_border = false;
                    allow_tearing = false;
                    layout = "dwindle";
                };

                decoration = {
                    rounding = 5;
                    rounding_power = 20;
                    active_opacity = 1.0;
                    inactive_opacity = 0.8;
                    
                    shadow = {
                        enabled = true;
                        range = 4;
                        render_power = 3;
                        color = lib.mkForce "0xee1a1a1a";
                    };
                    blur = {
                        enabled = true;
                        size = 10;
                        passes = 1;
                        vibrancy = 0.1696;
                    };
                };

                animations = {
                    enabled = true;
                };
            };
        };
    };
}
