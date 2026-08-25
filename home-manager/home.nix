{ config, pkgs, ... }:

{
  home.username = "alex";
  home.homeDirectory = "/home/alex"; 
  home.packages = [
    pkgs.fortune
    pkgs.cowsay
    pkgs.qemu_full
    pkgs.git-credential-manager
    pkgs.spotify
    pkgs.unar
    pkgs.kicad
    pkgs.cava
    pkgs.cmatrix
    pkgs.wineWow64Packages.stable
    pkgs.kdePackages.filelight
    pkgs.stack
    pkgs.asciiquarium
    pkgs.pipes
    pkgs.chafa
    pkgs.hyprshot
    pkgs.proton-vpn

    #for waybar
    pkgs.pavucontrol
    pkgs.peaclock
    pkgs.swaynotificationcenter

  ];
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 16;
  };
  home.stateVersion = "26.05";
  stylix = {
    autoEnable = true;
    fonts = {
      monospace = {
        package = pkgs.iosevka;
	name = "Iosevka";
      };
      sansSerif = {
        package = pkgs.fira-sans;
	name = "Fira Sans";
      };
      serif = {
        package = pkgs.prociono;
	name = "Prociono";
      };
    };
  };



  imports = [
    ./firefox.nix
    ./hypr/hyprland.nix
    ./waybar/waybar.nix
    ./kitty.nix
    ./eza.nix
    ./gnome_polkit.nix
    ./btop.nix
    ./discord.nix
    ./rofi.nix
    ./fastfetch.nix
    ./feh.nix
    ./ncspot.nix
    ./starship.nix
    ./yazi.nix
    ./cava.nix
    ./zsh.nix
    ./zathura.nix
    ./neovim/neovim.nix
  ];
}
