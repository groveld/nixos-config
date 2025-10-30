{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.modules.git.enable = lib.mkEnableOption "git";
  config = lib.mkIf config.modules.git.enable {

    programs.git = {
      enable = true;
      package = pkgs.git;

      settings = {
        user = {
          name = "groveld";
          email = "3328493+groveld@users.noreply.github.com";
        };

        alias = {
          lg = "log --oneline --graph --all --decorate";
        };

        init.defaultBranch = "main";

        color.ui = "auto";

        filter.lfs = {
          clean = "git-lfs clean -- %f";
          smudge = "git-lfs smudge -- %f";
          process = "git-lfs filter-process";
          required = true;
        };
      };

      ignores = [
        ".DS_Store"
        ".DS_Store?"
        "._*"
        ".Spotlight-V100"
        ".Trashes"
        "ehthumbs.db"
        "Thumbs.db"
        "Desktop.ini"
        "*~"
      ];

    };
  };
}
