{ lib, config, pkgs, ... }: {
  options.modules.firefox.enable = lib.mkEnableOption "firefox";
  config = lib.mkIf config.modules.firefox.enable {

    environment.systemPackages = with pkgs; [
      firefox
    ];

    programs.firefox = {
      enable = true;

      wrapperConfig = {
        MOZ_ENABLE_WAYLAND = "0";
      };

      preferences = {
        "privacy.trackingprotection.enabled" = true;
        "privacy.resistFingerprinting" = true;
        "network.cookie.cookieBehavior" = 1;
        "browser.tabs.warnOnClose" = false;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.trimURLs" = false;
        "browser.cache.disk.enable" = false;
      };

      policies = {
        "DisableTelemetry" = true;
        "DisableAppUpdate" = true;
      };

    };
  };
}
