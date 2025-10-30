{ config, lib, pkgs, inputs, ... }: {

  stylix = {
    enable = true;

    image = ../../wallpapers/owl.jpg;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    polarity = "dark";

    fonts = {
      serif = {
        package = pkgs.nerd-fonts.hack;
        name = "Hack Nerd Font";
      };

      sansSerif = {
        package = pkgs.nerd-fonts.hack;
        name = "Hack Nerd Font";
      };

      monospace = {
        package = pkgs.nerd-fonts.hack;
        name = "Hack Nerd Font Mono";
      };

      sizes = {
        desktop = 13;
        applications = 15;
      };
    };

  };
}
