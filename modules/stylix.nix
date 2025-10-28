{ lib, config, pkgs, ... }: {
  options.modules.stylix.enable = lib.mkEnableOption "stylix";
  config = lib.mkIf config.modules.stylix.enable {

    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
      image = "../wallpapers/owl.jpg";
      polarity = "dark";

      targets = { };

      opacity = {
        terminal = 0.95;
        popups = 0.95;
      };

      cursor = {
        package = pkgs.hackneyed;
        name = "hackneyed-cursors";
        size = 24;
      };

      fonts = {
        serif = {
          package = pkgs.poly;
          name = "Poly";
        };

        sansSerif = {
          package = pkgs.fira-sans;
          name = "Fira Sans";
        };

        monospace = {
          package = pkgs.fira-mono;
          name = "Fira Mono";
        };

        emoji = {
          package = pkgs.nerd-fonts.space-mono;
          name = "Nerd Fonts Space Mono";
        };

        sizes = {
          applications = 10;
          desktop = 10;
          popups = 10;
          terminal = 10;
        };

      };
    };
  };
}
