{ inputs, system }:

let
    overlays = final: prev: {
        firefox-addons = final.nur.repos.rycee.firefox-addons;
    };
in
[
    overlays
    inputs.nurpkgs.overlays.default
]