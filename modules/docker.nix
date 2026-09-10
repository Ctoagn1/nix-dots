{pkgs, buildImage, ...}: 
{
  virtualisation.docker = {
    enable = true;
    hardware.nvidia-continer-toolkit.enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
} 
