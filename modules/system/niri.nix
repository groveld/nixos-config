{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.modules.niri.enable = lib.mkEnableOption "niri";
  config = lib.mkIf config.modules.niri.enable {

    environment.systemPackages = with pkgs; [
      waybar
      alacritty
      fuzzel
      mako
      swaylock
      swayidle
      rofi
      rofi-network-manager
      rofi-bluetooth
      yazi
      nemo
      ladybird
      wl-clipboard
    ];

    fonts.packages = with pkgs; [
      nerd-fonts.symbols-only
      nerd-fonts.jetbrains-mono
    ];

    programs.niri.enable = true;

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

  };
}
