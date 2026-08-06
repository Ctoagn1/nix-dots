{config, pkgs, lib, ...}:
{
    wayland.windowManager.hyprland.settings = {
	config = {
          input = {
              kb_layout = "us";
              kb_variant = "";
              kb_model   = "";
              kb_options = "";
              kb_rules   = "";
              follow_mouse = 1;
              touchpad = {
                  natural_scroll = true;
              };
              sensitivity = 0;
          }; 
	};
	device = {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
        };
        gesture = {
            fingers = 3;
            direction = "horizontal";
            action = "workspace";
        };
        monitor = {
            output = "";
            mode = "preferred";
            position = "auto";
            scale = "auto";
        };
    };
}
