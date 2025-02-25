{ pkgs, ... }:

{
    programs.rofi = {
        enable = true;
        plugins = with pkgs; [ rofi-emoji ];
        terminal = "${pkgs.alacritty}/bin/alacritty";
        theme = ./theme.rafi;
    };

    home.packages = [ pkgs.xdotool ];
}