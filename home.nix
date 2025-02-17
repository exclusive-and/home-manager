{ config, pkgs, ... }:

{
    home.username = "xand";
    home.homeDirectory = "/home/xand";

    home.stateVersion = "24.11"; # Check the Home Manager release notes before changing.

    home.packages = with pkgs; [
        gtkwave
        helvum
        pavucontrol
    ];

    programs.home-manager.enable = true; # Let Home Manager install and manage itself.

    programs.bash.enable = true;

    programs.direnv = {
        enable = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
    };

    programs.firefox = {
        enable = true;
        package = pkgs.firefox;
    };

    programs.fish.enable = true;

    programs.git = {
        enable = true;
        ignores = [
            ".direnv/"
            "dist-newstyle/"
            "obj_dir/"
        ];
        userEmail = "exclusiveandgate@gmail.com";
        userName = "exclusive-and";
    };

    programs.vscode = {
        enable = true;
        enableExtensionUpdateCheck = true;
        enableUpdateCheck = true;
        package = pkgs.vscodium;
        extensions = with pkgs.vscode-extensions; [
            haskell.haskell
            jnoortheen.nix-ide
            llvm-vs-code-extensions.vscode-clangd
            mkhl.direnv
            mshr-h.veriloghdl
        ];
    };
}
