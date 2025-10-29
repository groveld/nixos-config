{ inputs, lib, config, pkgs, ... }: {
  options.modules.firefox.enable = lib.mkEnableOption "firefox";
  config = lib.mkIf config.modules.firefox.enable {

    programs.firefox = {
      enable = true;
      package = pkgs.firefox;

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        decentraleyes
        ublock-origin
        clearurls
      ];

      profiles.default = {
        id = 0;
        name = "main";
        isDefault = true;

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
