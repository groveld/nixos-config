{ inputs, lib, config, pkgs, ... }: {

  imports = [
    ../../modules
  ];

  modules = {
    firefox.enable = true;
    git.enable = true;
    packages.enable = true;
  };

  home = {
    username = "martin";
    homeDirectory = "/home/martin";
  };

}
