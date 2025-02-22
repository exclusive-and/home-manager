{ config, pkgs, ... }:

let
    settings = {
        "browser.tabs.closeTabByDblclick" = true;
        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;
    };
in
    {
        programs.firefox = {
            enable = true;
            package = pkgs.firefox;
            profiles = {
                default = {
                    id = 0;
                    path = "2d43dm8x.default";
                    inherit settings;
                };
            };
        };
    }