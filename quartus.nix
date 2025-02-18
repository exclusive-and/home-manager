{ config, pkgs, ... }:

let
    run-quartus = pkgs.writeShellScriptBin "run-quartus" ''
        if [ "$#" -ne 1 ]; then
            >&2 echo "Usage:    run-quartus <version>"
            >&2 echo ""
            >&2 echo "          version:    pro or lite"
        fi

        if [ "$1" = "pro" ]; then
            ${pkgs.nix}/bin/nix shell github:Mop-u/nix-quartus#quartus-prime-pro --command "quartus"
        fi

        if [ "$1" = "lite" ]; then
            ${pkgs.nix}/bin/nix shell github:Mop-u/nix-quartus#quartus-prime-lite --command "quartus"
        fi
    '';
in
    run-quartus