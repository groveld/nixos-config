{ config, lib, pkgs, inputs, ... }: {

  stylix = {
    enable = true;

    image = ../../wallpapers/owl.jpg;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    polarity = "dark";

    cursor = {
      package = pkgs.catppuccin-cursors.frappeMauve;
      name = "catppuccin-frappe-mauve-cursors";
      size = 24;
    };

    fonts = {
      sizes = {
        desktop = 13;
        applications = 13;
      };
    };

  };
}
