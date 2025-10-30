{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  options.modules.firefox.enable = lib.mkEnableOption "firefox";
  config = lib.mkIf config.modules.firefox.enable {

    programs.firefox = {
      enable = true;
      package = pkgs.firefox;

      profiles.default = {
        id = 0;
        name = "main";
        isDefault = true;

        extensions.packages =
          let
            firefox-ext = inputs.firefox-addons.packages.x86_64-linux;
          in
          [
            firefox-ext.ublock-origin
          ];

        settings = {
          "browser.startup.homepage" = null;
          # Disable telemetry
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.ping-centre.telemetry" = false;
          "browser.tabs.crashReporting.sendReport" = false;
          "devtools.onboarding.telemetry.logged" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.server" = "";
        };

      };
    };
  };
}
