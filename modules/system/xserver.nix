{ lib, config, pkgs, ... }: {
  options.modules.xserver.enable = lib.mkEnableOption "xserver";
  config = lib.mkIf config.modules.xserver.enable {

    services.xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
    };

    services.displayManager.ly.enable = true;

  };
}
