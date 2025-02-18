{ config, pkgs, ... }:

let
    run-quartus = pkgs.writeShellScriptBin "quartus" ''
        if [ "$#" -ne 1 ]; then
            >&2 echo "Usage: quartus <version>"
            >&2 echo ""
            >&2 echo "  version: pro or lite"
        fi

        if [ "$1" = "pro" ]; then
            ${pkgs.nix}/bin/nix run github:Mop-u/nix-quartus#quartus-prime-pro
        fi

        if [ "$1" = "lite" ]; then
            ${pkgs.nix}/bin/nix run github:Mop-u/nix-quartus#quartus-prime-lite
        fi
    '';
in
    run-quartus