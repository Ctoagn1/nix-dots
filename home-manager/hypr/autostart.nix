{config, pkgs, lib, ...}:
{
    wayland.windowManager.hyprland.settings.on = {
        _args = [
            "hyprland.start"
            (lib.generators.mkLuaInline "function()\n  hl.exec_cmd(\"waybar & hyprpaper\")\nend")
        ];
    };
}