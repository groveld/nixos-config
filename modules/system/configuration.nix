{ inputs, config, pkgs, ... }: {

  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./greetd.nix
    ./niri.nix
    ./stylix.nix
    ./xserver.nix
  ];

  modules = {
    audio.enable = true;
    bluetooth.enable = true;
    greetd.enable = true;
    niri.enable = true;
    xserver.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  services.xserver.desktopManager.xterm.enable = false;

  environment = {
    defaultPackages = [ ];
    systemPackages = with pkgs; [ ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
      keep-outputs = true;
      keep-derivations = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      systemd-boot.enable = true;
      systemd-boot.editor = false;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
  };

  time.timeZone = "Europe/Amsterdam";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "nl_NL.UTF-8";
      LC_IDENTIFICATION = "nl_NL.UTF-8";
      LC_MEASUREMENT = "nl_NL.UTF-8";
      LC_MONETARY = "nl_NL.UTF-8";
      LC_NAME = "nl_NL.UTF-8";
      LC_NUMERIC = "nl_NL.UTF-8";
      LC_PAPER = "nl_NL.UTF-8";
      LC_TELEPHONE = "nl_NL.UTF-8";
      LC_TIME = "nl_NL.UTF-8";
    };
  };

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  users.users.martin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  networking.networkmanager.enable = true;

  system.stateVersion = "25.05";

}
