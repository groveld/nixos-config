{ inputs, lib, config, pkgs, ... }: {

  imports = [
    ../../modules
  ];

  modules = {
    audio.enable = true;
    bluetooth.enable = true;
    firefox.enable = true;
    git.enable = true;
    greetd.enable = true;
    niri.enable = true;
    packages.enable = true;
  };

}
