{ config, pkgs, inputs, ...}:
{ 
  stylix.targets.firefox = {
    profileNames = [ "alex" ];
    enable = true;
  };
  programs.firefox = {
    enable = true;
    profiles.alex = {
      id = 0;
      name = "Alex";
      isDefault = true;
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.search.defaultenginename" = "ddg";
	"browser.search.order.1" = "ddg";
	"browser.startup.page" = 1; # 1 = home
	"browser.startup.homepage" = "about:home";
	"layout.css.prefers-color-scheme.content-override" = 0; #dark theme
	"browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
	"browser.newtabpage.pinned" = [
	 {
	  title = "youtube";
	  url = "https://www.youtube.com/";
	 }
	 {
	  title = "search.nixos";
	  url = "https://search.nixos.org/";
	 }
	 {
	  title = "github";
	  url = "https://www.github.com/";
	 }
	];
      };
      search = {
        force = true;
	default = "ddg";
	engines = {
	  "Nix Packages" = {
	    urls = [{
	      template = "https://search.nixos.org/packages";
	      params = [
		{ name = "type"; value = "packages"; }
		{ name = "query"; value = "{searchTerms}"; }
	      ];
	    }];
	    icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
	    definedAliases = [ "@np" ];
	  };
	  "NixOS Wiki" = {
	    urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
	    icon = "http://nixos.wiki/favicon.png";
	    updateInterval = 24 * 60 * 60 * 1000;
	    definedAliases = [ "@nw" ];
	  };
	  "bing".metaData.hidden = true;
	  "google".metaData.hidden = true;
	};
      };
    };
  };
}
