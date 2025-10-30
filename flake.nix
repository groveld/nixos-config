{
  description = "Groveld's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      stylix,
      ...
    }@inputs:
    let
      mkSystem =
        system: hostname: username:
        let
          settings = {
            inherit system;
            inherit hostname;
            inherit username;
            stateVersion = "25.05";
          };
        in
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs settings; };
          modules = [
            { networking.hostName = hostname; }
            ./hosts/${hostname}/hardware-configuration.nix
            ./modules/system/configuration.nix
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
            {
              home-manager = {
                users.${username} = ./hosts/${hostname}/home.nix;
                extraSpecialArgs = { inherit inputs settings; };
                useUserPackages = true;
                useGlobalPkgs = true;
                backupFileExtension = "backup";
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        rosetta = mkSystem "x86_64-linux" "rosetta" "martin";
      };
    };
}
