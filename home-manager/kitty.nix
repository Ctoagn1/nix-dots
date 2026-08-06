{config, pkgs, lib, ...}:
{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    font = lib.mkForce {
      package = pkgs.fira-code;
      name = "Fira Code";
      size = 8;
    };

  };
}
