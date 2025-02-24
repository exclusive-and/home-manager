{
    description = "Home Manager configuration of xand";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-24.11";

        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nurpkgs = {
            url = "github:nix-community/NUR";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        rycee-firefox-addons = {
            url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, ... } @ inputs:
        let
            system = "x86_64-linux";
<<<<<<< HEAD
            pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
            };
        in {
            homeConfigurations."gaming" = home-manager.lib.homeManagerConfiguration {
=======

            overlays = import ./overlays.nix {
                inherit inputs system;
            };

            pkgs = import nixpkgs {
                inherit overlays system;
                config.allowUnfree = true;
            };
        in
        {
            homeConfigurations."xand" = home-manager.lib.homeManagerConfiguration {
>>>>>>> 6757da7 (Added overlays.nix)
                inherit pkgs;

                # Specify your home configuration modules here, for example,
                # the path to your home.nix.
                modules = [ ./home.nix ];

                # Optionally use extraSpecialArgs
                # to pass through arguments to home.nix
            };
        };
}
