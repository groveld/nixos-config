{
    description = "NixOS configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        niri-flake = {
            url = "github:sodiboo/niri-flake";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.nixpkgs-stable.follows = "nixpkgs-stable";
        };
    };

    outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }@inputs:
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
            lib = nixpkgs.lib;

            mkSystem = pkgs: system: hostname: user:
                pkgs.lib.nixosSystem {
                    system = system;
                    modules = [
                        { networking.hostName = hostname; }
                        ./modules/system/configuration.nix
                        ./hosts/${hostname}/hardware-configuration.nix
                        home-manager.nixosModules.home-manager
                        {
                            home-manager = {
                                useUserPackages = true;
                                useGlobalPkgs = true;
                                extraSpecialArgs = { inherit inputs; };
                                users.${user} = ./hosts/${hostname}/home-manager.nix;
                            };
                        }
                    ];
                    specialArgs = { inherit inputs user; };
                };

        in {
            nixosConfigurations = {
                rosetta = mkSystem inputs.nixpkgs "x86_64-linux" "rosetta" "martin";
            };
    };
}
