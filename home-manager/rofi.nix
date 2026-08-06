{config, pkgs, lib, ...}:
let 
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
    programs.rofi = {
      enable = true;
	theme = {
		"configuration" = {
		    modi =                    "drun,run";
		    font =                       "Iosevka 14";
		    show-icons =                 false;
		    icon-theme =                 "kora";
		    display-drun =               "λ";
		    display-run =                "λ";
		    display-filebrowser =        "FILES";
		    display-window =             "WINDOW";
		    drun-display-format =        "{name}";
		    hover-select =               false;
		    scroll-method =              1;
		    me-select-entry =            "";
		    me-accept-entry =            "MousePrimary";
		    window-format =             "{w} · {c} · {t}";
		    terminal = "kitty";
		};

		"#window" = {
		    width = mkLiteral                      "350px";
		    x-offset = mkLiteral                   "0px";
		    y-offset =   mkLiteral                  "0px";
		    spacing =  mkLiteral                    "0px";
		    padding =  mkLiteral                    "10px";
		    margin =  mkLiteral                     "0px"; 
		    border =  mkLiteral                     "0px";
		    cursor =  mkLiteral                    "default";
		    transparency =             "real";
		    location =  mkLiteral                  "center";
		    anchor =  mkLiteral                    "center";
		    fullscreen =                  false;
		    enabled =                     true;
		    border-radius =  mkLiteral             "12px";
		};

		"#listview" = {
		    columns = mkLiteral "1";
		    lines = mkLiteral "3";
		    fixed-height = true;
		    fixed-columns = true;
		    cycle = false;
		    scrollbar = false;
		    border = mkLiteral "0px solid";
		};


		"#prompt" = {
		    padding = mkLiteral "0 5px 0 5px";
		};

		"#inputbar" = {
		    children = map mkLiteral ["prompt" "entry"];
		    spacing = mkLiteral "2px";
		    border-radius = mkLiteral "8px";
		    padding = mkLiteral "4px";
		};

		"#entry" = {
		    placeholder = "seek and ye shall find";
		    padding = mkLiteral "2px";
		};

		"#mainbox" = {
		    spacing = mkLiteral "4px";
		    margin = mkLiteral "0";
		    padding = mkLiteral "0";
		    children = map mkLiteral ["inputbar" "listview" "message"];
		};

		"#listview" = {
		    border-radius = mkLiteral "8px";
		};

		"#element" = {
		    spacing = mkLiteral "0";
		    margin = mkLiteral "0";
		    padding = mkLiteral "8px";
		    border = mkLiteral "0px solid";
		    border-radius = mkLiteral "0";
		};
	};
  };
}
