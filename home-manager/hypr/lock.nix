{config, pkgs, lib, ...}:
{
  home.file.".local/share/fonts/Angel-Wish.ttf".source = ./fonts/Angel-Wish.ttf;
  security.pam.services.hyprlock = true;
  programs.hyprlock = {
    settings = {
      background = {
        monitor = "";
        path = ./../../wallpapers/current_wallpaper.jpg;
        blur_passes = 2;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
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
        size = "10%, 3%";
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_text_format = "@";
        font_family = "Angel Wish";
        placeholder_text  = "abandon all hope ye who enter here";
        fade_on_empty = false;
        position = "0, -150";
        valign = "center";
        check_text = "awaiting judgement...";
        fail_text = "thou art unworthy";
      };

      label = {
        monitor = "";
        text = ''cmd[update:1000] echo "$TIME" '';
        text_align = "center";
        font_size = 200;
        font_family = "Angel Wish";
        halign = "center";
        valign = "center";

      };
    };
  };
}
