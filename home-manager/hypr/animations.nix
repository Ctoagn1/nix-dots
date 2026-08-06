{config, pkgs, lib, ...}:
let
  lua = lib.generators.mkLuaInline;
  cur = name: args: {
    _args = [
      name
      (lua args)
    ];
  };
  anim = data: {
    _args = [
      (lua data)
    ];
  };
in
{
  wayland.windowManager.hyprland.settings = {
    curve = [
      (cur "easeOutQuint" ''{ type = "bezier", points = { {0.23, 1}, {0.32, 1}}}'')
      (cur "easeInOutCubic" ''{type = "bezier", points = { {0.15, 0}, {0.1, 1}}}'')
      (cur "linear"  ''{type = "bezier", points = {{0, 0}, {1, 1}}}'')
      (cur "almostLinear" ''{type = "bezier", points = {{0.5, 0.5}, {0.75, 1}}}'')
      (cur "quick" ''{type = "bezier", points = { {0.15, 0}, {0.1, 1}}}'')
      (cur "easy" ''{type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 }'')
    ];
    animation = [
      (anim ''{ leaf = "global", enabled = true, speed = 10, bezier = "default"}'')
      (anim ''{ leaf = "border", enabled = true, speed = 7.39, bezier = "easeOutQuint"}'')
      (anim ''{ leaf = "windows", enabled = true, speed = 5.79, spring = "easy"}'')
      (anim ''{ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" }'')
      (anim ''{ leaf = "windowsOut", enabled = true, speed = 2.49, bezier = "linear", style = "popin 87%"}'')
      (anim ''{ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear"}'')
      (anim ''{ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear"}'')
      (anim ''{ leaf = "fade", enabled = true, speed = 2.03, bezier = "quick"}'')	    
      (anim ''{ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint"}'')
      (anim ''{ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade"}'')
      (anim ''{ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade"}'')
      (anim ''{ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear"}'')	    
      (anim ''{ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear"}'')
      (anim ''{ leaf = "workspaces", enabled = true, speed = 3.94, bezier = "almostLinear", style = "slide"}'')
      (anim ''{ leaf = "workspacesIn", enabled = true, speed = 0.51, bezier = "almostLinear", style = "slide"}'')
      (anim ''{ leaf = "workspacesOut", enabled = true, speed = 0.94, bezier = "almostLinear", style = "slide"}'')	    
      (anim ''{ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick"}'')
    ];
  };
}
