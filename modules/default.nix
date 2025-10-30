{ inputs, config, pkgs, ... }: {

  home.stateVersion = "25.05";

  imports = [
    ./firefox.nix
    ./git.nix
    ./packages.nix
  ];

}
