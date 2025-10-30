{ config, lib, pkgs, inputs, ... }: {

  stylix = {
    enable = true;

    image = ../../wallpapers/owl.jpg;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    polarity = "dark";

    fonts = {
      sizes = {
        desktop = 13;
        applications = 13;
      };
    };

  };
}
