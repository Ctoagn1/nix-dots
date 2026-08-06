{config, pkgs, libs, ...}:
{
  programs.ncspot = {
    enable = true;
    settings = {
      use_nerdfont = true;
      initial_screen = "cover";
      notify = false;
      library_tabs = ["tracks" "albums" "artists" "playlists" "podcasts" "browse"];

    };
  };
}
