{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.modules.packages.enable = lib.mkEnableOption "packages";
  config = lib.mkIf config.modules.packages.enable {

    home.packages = with pkgs; [
      curl
      wget
      bat
      btop
      nil
      nixd
    ];

    programs.zed-editor = {
      enable = true;
      extensions = [ "nix" ];
      userSettings = {
        hour_format = "hour24";
        vim_mode = false;
        base_keymap = "VSCode";
      };
    };

  };
}
