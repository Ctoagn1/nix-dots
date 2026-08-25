# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, options, ... }: 
{
  
   # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking.hostName = "chokmah"; # Define your hostname.

  #services.displayManager.sddm = {
  #  enable = true;
  #  wayland.enable = true;
  #  theme = "sddm-astronaut-theme";
  #  extraPackages = [
  #    pkgs.kdePackages.qtmultimedia #needed for theme video backend
  #  ];
  #};


  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager = {
    enable = true;
    plugins = [pkgs.networkmanager-openvpn];
  };
  networking.enableIPv6 = true;
  services.gnome.gnome-keyring.enable = true;
  networking.firewall.checkReversePath = false;

  # Set your time zone.
   time.timeZone = "America/New_York";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
#   console = {
#     font = "Lat2-Terminus16";
#     keyMap = "us";
#     useXkbConfig = true; # use xkb.options in tty.
#   };

  
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      iosevka
      inter
      prociono
    ]
    ++ builtins.filter lib.attrsets.isDerivation
    (builtins.attrValues pkgs.nerd-fonts);
    enableDefaultPackages = true;
    fontconfig = {
      defaultFonts = {
        serif = [ "Prociono" ];
	sansSerif = [ "Inter" ];
	monospace = [ "Iosevka" ];
      };
    };
  };
  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.videoDrivers = ["nvidia"];
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
   services.printing.enable = true;

   security.rtkit.enable = true;
   security.polkit.enable = true;
   security.pam.services.hyprlock = {};
   services.pipewire = {
     enable = true;
     pulse.enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     jack.enable = true;
   };
  # Enable touchpad support (enabled default in most desktopManager).
   services.libinput.enable = true;

   services.upower.enable = true;
   services.power-profiles-daemon.enable = true;
   services.blueman.enable = true;
  stylix = {
    enable = true;
    image = ../wallpapers/current_wallpaper.jpg;
    polarity = "dark";
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.mutableUsers = false;
   users.users.alex = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     shell = pkgs.zsh;
     home = "/home/alex";
     hashedPasswordFile = "/etc/nixos/userPasswd.txt";
   };
   users.users.root = {
     hashedPasswordFile = "/etc/nixos/rootPasswd.txt";
   };
   programs.hyprland = {
     enable = true;
     xwayland.enable = true;
   };
   programs.zsh.enable = true;
   programs.steam.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
   environment.sessionVariables = {
     WLR_NO_HARDWARE_CURSORS = "1";
     NIXOS_OZONE_WL = "1";
   };
   environment.systemPackages = [
     pkgs.vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     pkgs.wget
     pkgs.git
     pkgs.mako
     pkgs.wireguard-tools
     #(pkgs.sddm-astronaut.override { embeddedTheme = "black_hole";})
     pkgs.libnotify
     pkgs.hyprpaper
     pkgs.kitty
     pkgs.rofi
     pkgs.wine
     pkgs.neovim
     pkgs.yazi
     pkgs.kdePackages.dolphin
     pkgs.kdePackages.ark
     pkgs.vscode
     pkgs.busybox
     pkgs.pkg-config
     pkgs.alsa-lib
     pkgs.brightnessctl
     pkgs.playerctl
     pkgs.coreutils

    pkgs.python3
    pkgs.rustup
    pkgs.gcc
    pkgs.ghc
   ];
   nixpkgs.config.allowUnfree = true;
   xdg.portal.enable = true;
   xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland];
   environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ]; #so portal definitions get linked to user packages

   hardware = {
     graphics.enable = true;
     enableRedistributableFirmware = true;
     bluetooth = {
       enable = true;
       powerOnBoot = false;
     };
     nvidia = {
       open = true;
     };
   };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?



# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/91075fbd-e09d-4daf-ba04-154a9c4ff47a";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/0ca55b3f-d18d-4690-b509-ce60d5c53b63";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/A68D-0BD1";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/storage" =
    { device = "/dev/disk/by-uuid/37c6e3dd-f96a-4f3d-be5c-5a2eb50d590b";
      fsType = "ext4";
    };

  swapDevices = [{ device = "/dev/disk/by-uuid/73d0e8ff-0a54-48fd-9d27-04e861d86591"; }];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
