{config, pkgs, lib, ...}:
{
  home.file.".local/share/fonts/Angel-Wish.ttf".source = ./fonts/Angel-Wish.ttf;
  
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        monitor = ""; 
        blur_passes = 1;
        contrast = 0.8916;
        brightness = 0.4172;
        vibrancy = 0.6696;
        vibrancy_darkness = 0.25;
      };

      general = {
        ignore_empty_input = true;
        fail_timeout = 1000;
        hide_cursor = true;
      };

      animations = {
        enabled = true;
        animation = [
          "fade, 1, 6, default"
          "fadeIn, 1, 6, default"
          "fadeOut, 1, 6, default"
        ];
      };

      input-field = {
        size = "15%, 6%";
        rounding = 10;
        outline_thickness = 2;
        dots_size = 0.2;
        dots_text_format = "Ø";
        dots_spacing = 0.2;
        font_family = "Angel Wish";
        placeholder_text  = "abandon all hope ye who enter here";
        fade_on_empty = false;
        position = "0, -400";

        check_text = "awaiting judgement...";
        fail_text = "thou art unworthy";
      };

      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$TIME" '';
          text_align = "center";
          font_size = 400;
          font_family = "Angel Wish";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "Welcome, $USER.";
          font_size = 30;
          font_family = "Angel Wish";
          position = "0, -250";
        }

        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%A, %B %d")"'';
          font_size = 50;
          font_family = "Angel Wish";
          position = "0, 300";
        }
      ];
    };
  };
}
