{config, pkgs, lib, ...}:
let
  lua = lib.generators.mkLuaInline;
  bind = key: action: {
    _args = [
      key
      (lua action)
    ];
  };
  bind' = key: action: ops: {
    _args = [
      key
      (lua action)
      (lua ops)
    ];
  };
  exec = cmd: ''hl.dsp.exec_cmd("${cmd}")'';
  mvws = ws: ''hl.dsp.focus({workspace = "${ws}"})'';
  mvwd = ws: ''hl.dsp.window.move({ workspace = "${ws}"})'';
  mvwddr = dr: ''hl.dsp.window.move({ direction = "${dr}"})'';
  fs = mode: ''hl.dsp.window.fullscreen({ mode = "${mode}"})'';
  focusdr = dr: ''hl.dsp.focus({ direction = "${dr}"})'';
  float = ''hl.dsp.window.float({ action = "toggle" })'';
  pseudo = ''hl.dsp.window.pseudo()'';
  togglesplit = ''hl.dsp.layout("togglesplit")'';
  drag = ''hl.dsp.window.drag()'';
  resize = ''hl.dsp.window.resize()'';
  close = ''hl.dsp.window.close()'';
  
  mainMod = "SUPER";
  terminal = "kitty";
  fileManager = "kitty -e yazi";
  menu = "rofi -show drun";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      bind = [        
        (bind' ("XF86AudioNext") (exec "playerctl next") "{ locked = true }")
	(bind' ("XF86AudioPause") (exec "playerctl play-pause") "{ locked = true }")
        (bind' ("XF86AudioPlay") (exec "playerctl play-pause") "{ locked = true }")
        (bind' ("XF86AudioPrev") (exec "playerctl previous") "{ locked = true }")

	(bind' (mainMod + " + mouse:272") (drag) "{ mouse = true }")
	(bind' (mainMod + " + mouse:273") (resize) "{ mouse = true }")

	(bind' ("XF86AudioRaiseVolume") (exec "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+") "{ locked = true, repeating = true}")
	(bind' ("XF86AudioLowerVolume") (exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-") "{ locked = true, repeating = true}")
        (bind' ("XF86AudioMute") (exec "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle") "{ locked = true, repeating = true}")
	(bind' ("XF86AudioMicMute") (exec "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle") "{ locked = true, repeating = true}")
	(bind' ("XF86MonBrightnessUp") (exec "brightnessctl -e4 -n2 set 5%+") "{ locked = true, repeating = true}")
	(bind' ("XF86MonBrightnessDown") (exec "brightnessctl -e4 -n2 set 5%-") "{ locked = true, repeating = true}")
      
        (bind (mainMod + " + M") (exec "command -v hyprshutdown >/dev/null 2>&1 hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")) 
	      (bind (mainMod + " + F") (exec fileManager))
	      (bind (mainMod + " + K") (exec terminal)) 
	      (bind (mainMod + " + V") float)
	      (bind (mainMod + " + P") pseudo)
      	(bind (mainMod + " + J") togglesplit)
	      (bind (mainMod + " + SPACE") (exec menu))
	      (bind (mainMod + " + Q") (close))

    	  (bind (mainMod + " + left") (focusdr "left"))
  	    (bind (mainMod + " + right") (focusdr "right"))
	      (bind (mainMod + " + up") (focusdr "up"))
	      (bind (mainMod + " + down") (focusdr "down"))

    	  (bind ("ALT + H") (mvwddr "left"))
  	    (bind ("ALT + J") (mvwddr "down"))
	      (bind ("ALT + K") (mvwddr "up"))
	      (bind ("ALT + L") (mvwddr "right"))


    	  (bind (mainMod + " + mouse_down") (mvws "e+1"))
  	    (bind (mainMod + " + mouse_up") (mvws "e-1"))

    	  (bind (mainMod + " + PRINT") (exec "hyprshot -m output"))
  	    (bind (mainMod + " + SHIFT + PRINT") (exec "hyprshot -m region"))
      ] ++ 
      builtins.concatLists (
      map (i:
        let
          key = toString i;
        in [
          (bind (mainMod + " + " + key) (mvws key))
          (bind (mainMod + " + SHIFT + " + key) (mvwd key))
        ]
      ) (lib.range 1 9));
    };
  };
}



