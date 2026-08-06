{ config, pkgs, ... }:

{
  home.username = "alex";
  home.homeDirectory = "/home/alex"; 
  home.packages = [
    pkgs.fortune
    pkgs.cowsay
    pkgs.git-credential-manager
    pkgs.spotify
    pkgs.unar
    pkgs.cava
    pkgs.cmatrix
    pkgs.wineWow64Packages.stable
    pkgs.kdePackages.filelight
    pkgs.stack
    pkgs.asciiquarium
    pkgs.pipes
    pkgs.chafa
  ]; 
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
  home.pointerCursor = {
    enable = true;
    name = "Graphite";
    package = pkgs.graphite-cursors;
    hyprcursor = {
      enable = true;
    };
    gtk.enable = true;

  };
  imports = [
    ./firefox.nix
    ./hypr/hyprland.nix
    ./kitty.nix
    ./eza.nix
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
