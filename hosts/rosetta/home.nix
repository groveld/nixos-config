{
  settings,
  ...
}:
{
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
    username = settings.username;
    homeDirectory = "/home/" + settings.username;
    stateVersion = settings.stateVersion;
  };
}
