{config, lib, pkgs, ...}:
{
  stylix.targets.starship.colors = {
    enable = true;
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = lib.concatStrings[
  "[](base04)"
  "$os"
  "$username"
  "[](bg:yellow fg:base04)"
  "$directory"
  "[](fg:yellow bg:base12)"
  "$git_branch"
  "$git_status"
  "[](fg:base12 bg:blue)"
  "$c"
  "$cpp"
  "$rust"
  "$golang"
  "$nodejs"
  "$bun"
  "$php"
  "$java"
  "$kotlin"
  "$haskell"
  "$python"
  "[](fg:blue bg:base14)"
  "$docker_context"
  "$conda"
  "$pixi"
  "[](fg:base14 bg:base02)"
  "$time"
  "[ ](fg:base02)"
  "$line_break$character"
];



  os = {
    disabled = false;
    style = "bg:base04 fg:white";
  };
  os.symbols = {
      Windows = "󰍲";
      Ubuntu = "󰕈";
      SUSE = "";
      Raspbian = "󰐿";
      Mint = "󰣭";
      Macos = "󰀵";
      Manjaro = "";
      Linux = "󰌽";
      Gentoo = "󰣨";
      Fedora = "󰣛";
      Alpine = "";
      Amazon = "";
      Android = "";
      AOSC = "";
      Arch = "󰣇";
      Artix = "󰣇";
      EndeavourOS = "";
      CentOS = "";
      Debian = "󰣚";
      Redhat = "󱄛";
      RedHatEnterprise = "󱄛";
      Pop = "";
  };

  username = {
    show_always = true;
    style_user = "bg:base04 fg:white";
    style_root = "bg:base04 fg:white";
    format = "[ $user ]($style)";
  };

  directory = {
    style = "fg:white bg:yellow";
    format = "[ $path ]($style)";
    truncation_length = 3;
    truncation_symbol = "…/";
  };

  directory.substitutions = {
    Documents = "󰈙 ";
    Downloads = " ";
    Music = "󰝚 ";
    Pictures = " ";
    Developer = "󰲋 ";
  };

  git_branch = {
    symbol = "";
    style = "bg:base12";
    format = "[[ $symbol $branch ](fg:white bg:base12)]($style)";
  };
  git_status = {
    style = "bg:base12";
    format = "[[($all_status$ahead_behind )](fg:white bg:base12)]($style)";
  };

  nodejs = {
    symbol = "";
    style = "bg:blue";
    format = "[[ $symbol( $version) ](fg:white bg:blue)]($style)";
  };
  bun = {
    symbol = "";
    style = "bg:blue";
    format = "[[ $symbol( $version) ](fg:white bg:blue)]($style)";
  };

  c = {
    symbol = " ";
    style = "bg:blue";
    format = "[[ $symbol( $version) ](fg:white bg:blue)]($style)";
  };

  cpp = {
    symbol = " ";
    style = "bg:blue";
    format = "[[ $symbol( $version) ](fg:white bg:blue)]($style)";
  };

  rust = {
    symbol = "";
    style = "bg:blue";
    format = "[[ $symbol( $version) ](fg:white bg:blue)]($style)";
  };

  golang = {
    symbol = "";
    style = "bg:blue";
    format = "[[ $symbol( $version) ](fg:white bg:blue)]($style)";
  };

  php = {
    symbol = "";
    style = "bg:blue";
    format = "[[ $symbol( $version) ](fg:white bg:blue)]($style)";
  };

  java = {
    symbol = "";
    style = "bg:blue";
    format = "[[ $symbol( $version) ](fg:white bg:blue)]($style)";
  };

  kotlin = {
    symbol = "";
    style = "bg:blue";
    format = "[[ $symbol( $version) ](fg:white bg:blue)]($style)";
  };

  haskell = {
    symbol = "";
    style = "bg:blue";
    format = "[[ $symbol( $version) ](fg:white bg:blue)]($style)";
  };

  python = {
    symbol = "";
    style = "bg:blue";
    format = "[[ $symbol( $version) ](fg:white bg:blue)]($style)";
  };

  docker_context = {
    symbol = "";
    style = "bg:base14";
    format = "[[ $symbol( $context) ](fg:base17 bg:base14)]($style)";
  };

  conda = {
    style = "bg:base14";
    format = "[[ $symbol( $environment) ](fg:base17 bg:base14)]($style)";
  };

  pixi = {
    style = "bg:base14";
    format = "[[ $symbol( $version)( $environment) ](fg:white bg:base14)]($style)";
  };

  time = {
    disabled = false;
    time_format = "%R";
    style = "bg:base02";
    format = "[[  $time ](fg:white bg:base02)]($style)";
  };

  line_break = {
    disabled = false;
  };

  character = {
    disabled = false;
    success_symbol = "[](bold fg:base04)";
    error_symbol = "[](bold fg:base08)";
    vimcmd_symbol = "[](bold fg:base04)";
    vimcmd_replace_one_symbol = "[](bold fg:base12)";
    vimcmd_replace_symbol = "[](bold fg:base12)";
    vimcmd_visual_symbol = "[](bold fg:base06)";
  };
    };
  };
}
