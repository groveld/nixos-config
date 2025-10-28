{ lib, config, pkgs, ... }: {
  options.modules.git.enable = lib.mkEnableOption "git";
  config = lib.mkIf config.modules.git.enable {

    environment.systemPackages = with pkgs; [
      git
    ];

    programs.git = {
      enable = true;

      userName = "groveld";
      userEmail = "3328493+groveld@users.noreply.github.com";

      aliases = {
        st = "status";
        co = "checkout";
        ci = "commit";
        br = "branch";
        lg = "log --oneline --graph --all --decorate";
      };

      extraConfig = {
        init = { defaultBranch = "main"; };
        color = { ui = "auto"; };
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
