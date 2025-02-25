{ config, pkgs, ... }:

let
    username = "xand";

    homeDirectory = "/home/${username}";

    xmonad = {
        config = ./xmonad.hs;
        enable = true;
        enableContribAndExtras = true;
        extraPackages = haskellPackages: [
            haskellPackages.containers
            haskellPackages.dbus
            haskellPackages.xmonad-contrib
        ];
    };

    packages = with pkgs; [
        coppwr # 
        gtkwave
        helvum
        pwvucontrol
    ];
    
    xsessionInit = ''
        set +x
        ${pkgs.util-linux}/bin/setterm -blank 0 -powersave off -powerdown 0
        ${pkgs.xorg.xset}/bin/xset s off
    '';
in
{
    home = {
        inherit username homeDirectory packages;
        sessionVariables = {
            DISPLAY = ":0";
        };
        stateVersion = "24.11"; # Check the Home Manager release notes before changing.
    };

    imports = [
        ./programs/alacritty
        ./programs/direnv
        ./programs/firefox
        ./programs/fish
        ./programs/git
        ./programs/rofi
        ./programs/vscodium
        ./services/picom
    ];

    news.display = "silent";

    programs.home-manager.enable = true; # Let Home Manager install and manage itself.

    xsession = {
        enable = true;
        initExtra = xsessionInit;
        scriptPath = ".xinitrc";
        windowManager.xmonad = xmonad;
    };
}