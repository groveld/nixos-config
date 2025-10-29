{ inputs, config, pkgs, ... }: {

  home = {
    # username = "martin";
    # homeDirectory = "/home/martin";
    stateVersion = "25.05";
  };

  imports = [
    # ./audio.nix
    # ./bluetooth.nix
    ./firefox.nix
    ./git.nix
    # ./greetd.nix
    ./niri.nix
    ./packages.nix
  ];

}
