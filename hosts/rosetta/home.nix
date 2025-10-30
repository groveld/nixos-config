{ inputs, lib, config, pkgs, ... }: {

  imports = [
    ../../modules/firefox.nix
    ../../modules/git.nix
    ../../modules/packages.nix
  ];

  modules = {
    firefox.enable = true;
    git.enable = true;
    packages.enable = true;
  };

  home = {
    username = "martin";
    homeDirectory = "/home/martin";
    stateVersion = "25.05";
  };

}
