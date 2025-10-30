{ lib, config, pkgs, ... }: {
  options.modules.niri.enable = lib.mkEnableOption "niri";
  config = lib.mkIf config.modules.niri.enable {

    environment.systemPackages = with pkgs; [
      niri
      waybar
      alacritty
      fuzzel
      mako
      swaylock
      swayidle
      rofi
      rofi-network-manager
      rofi-bluetooth
    ];

    fonts.packages = with pkgs; [
      nerd-fonts.symbols-only
      nerd-fonts.jetbrains-mono
    ];

    programs = {
      niri.enable = true;
      waybar.enable = false;
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

  };
}
