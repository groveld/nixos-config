{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.modules.greetd.enable = lib.mkEnableOption "greetd";
  config = lib.mkIf config.modules.greetd.enable {

    services.greetd = {
      enable = true;
      restart = false;
      settings = rec {
        tuigreet_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-user-session --cmd niri-session";
          user = "greeter";
        };
        default_session = tuigreet_session;
      };
    };

    # unlock keyring on login
    security.pam.services.greetd.enableGnomeKeyring = true;

    systemd.services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };

  };
}
