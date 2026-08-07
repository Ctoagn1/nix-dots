{config, pkgs, lib, ...}:
{
  programs.discord = {
    enable = true;
  };
  programs.vesktop = {
    enable = true;

    vencord.settings = {
      autoUpdate = true;
      autoUpdateNotification = true;
      notifyAboutUpdates = true;
    };

    plugins = {
      ClearURLs.enabled = true;
      FixYoutubeEmbeds.enabeled = true;
    };
  };
}
