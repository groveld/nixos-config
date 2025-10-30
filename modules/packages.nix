{ lib, config, pkgs, ... }: {
  options.modules.packages.enable = lib.mkEnableOption "packages";
  config = lib.mkIf config.modules.packages.enable {

    home.packages = with pkgs; [
      curl
      wget
      bat
      btop
    ];

    programs.zed-editor.enable = true;

  };
}
