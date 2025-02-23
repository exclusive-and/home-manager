{
    description = "Home Manager configuration of xand";

    inputs = {
        # Specify the source of Home Manager and Nixpkgs.
        nixpkgs.url = "nixpkgs/nixos-24.11";
        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, ... }:
        let
            system = "x86_64-linux";
            pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
            };
        in {
            homeConfigurations."gaming" = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;

                # Specify your home configuration modules here, for example,
                # the path to your home.nix.
                modules = [ ./home.nix ];

                # Optionally use extraSpecialArgs
                # to pass through arguments to home.nix
            };
        };
}
