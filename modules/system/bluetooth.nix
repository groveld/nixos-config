{ lib, config, pkgs, ... }: {
  options.modules.bluetooth.enable = lib.mkEnableOption "bluetooth";
  config = lib.mkIf config.modules.bluetooth.enable {

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };

    services.blueman.enable = true;

  };
}
