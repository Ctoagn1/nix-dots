{config, pkgs, lib, ...}:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      mgr = {
        sort_by = "mtime";
	sort_sensitive = true;
	linemode = "size";
	show_hidden = true;
	show_symlink = true;
      };
      opener = {
        edit = [
	  { run = ''nvim "$@"''; desc = "nvim"; block = true; for = "unix"; }
	  { run = ''code "$@"''; block = true; for = "unix"; }
	];
	play = [
	  {run = ''vlc "$@"''; orphan = true; for = "unix"; }
	];
	extract = [
	  { run = ''unar "$1"''; desc = "Extract here"; for = "unix"; }
	];
	open = [
	  { run = ''feh "$@"''; desc = "Open"; for = "linux";}
	];
	reveal = [
	  {run = ''xdg-open "$(dirname "$1")"''; desc = "Reveal"; for = "linux";}
	];
	pdf = [
      {run = ''zathura "$@"''; desc = "Zathura"; orphan = true; for = "unix";}
	];

      };
      open = {
        rules = [
			# Folder
			{ url = "*/"; use = ["edit" "open" "reveal"]; }
			# Text
			{ mime = "text/*"; use = ["edit" "reveal"]; }
			# Image
			{ mime = "image/*"; use = ["open" "reveal"]; }
			#PDF
			{ mime = "application/pdf"; use = ["pdf" "reveal"];}
			# Media
			{ mime = "{audio,video}/*"; use = ["play" "reveal"]; }
			# Archive
			{ mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}"; use = ["extract" "reveal"]; }
			# JSON
			{ mime = "application/{json,ndjson}"; use = ["edit" "reveal"]; }
			{ mime = "*/javascript"; use = ["edit" "reveal"]; }
			# Empty file
			{ mime = "inode/empty"; use = ["edit" "reveal"]; }
			# Fallback
			{ url = "*"; use = ["open" "reveal"]; }
        ];
      };
    };
  };
}
