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
        initial_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-user-session --cmd niri-session --greeting 'welcome back'";
          user = "martin";
        };
        default_session = initial_session;
      };
    };

    # unlock keyring on login
    security.pam.services.greetd.enableGnomeKeyring = true;

    systemd.services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal"; # Without this errors will spam on screen
      # Without these bootlogs will spam on screen
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };

  };
}
