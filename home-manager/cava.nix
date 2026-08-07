{config, pkgs, lib, ...}:
{

    programs.cava = {
      enable = true;
      settings = {
        general = {
          framerate = 60;
          autosens = 1;
          scaling = "linear";
          bars = 0; #auto 
          center_align = 1;
          max_height = 100;
        }; 
      };
    };
    stylix.targets.cava.rainbow.enable = true;
}
