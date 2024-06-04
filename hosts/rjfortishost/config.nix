{
  config,
  pkgs,
  host,
  inputs,
  username,
  options,
  ...
}:

{
  imports = [
    ./hardware.nix
    ./users.nix
  ];

  # Kernel
  # boot.kernelPackages = pkgs.linuxPackages;
  # boot.kernelPackages = pkgs.linuxPackages_zen;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "${host}";
  networking.timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];

  # Set your time zone.
  time.timeZone = "America/El_Salvador";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_SV.UTF-8";
    LC_IDENTIFICATION = "es_SV.UTF-8";
    LC_MEASUREMENT = "es_SV.UTF-8";
    LC_MONETARY = "es_SV.UTF-8";
    LC_NAME = "es_SV.UTF-8";
    LC_NUMERIC = "es_SV.UTF-8";
    LC_PAPER = "es_SV.UTF-8";
    LC_TELEPHONE = "es_SV.UTF-8";
    LC_TIME = "es_SV.UTF-8";
  };

  programs = {
    firefox.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  #users = {mutableUsers = true;};

  environment.systemPackages =
    let
      #sugar = pkgs.callPackage ../../pkgs/sddm-sugar-dark.nix { };
    in
    with pkgs;
    [
        vim
        neovim
        vscode
        gedit

        curl
        wget

        zip
        unzip

        git
        wezterm

        rofi

        firefox
        chromium

        htop
        neofetch
        flameshot
        xclip
    ];

  environment.variables = {
    #ZANEYOS_VERSION = "2.1";
    #ZANEYOS = "true";
  };

  # Services to start
  services = {
    xserver = {
        enable = true;
        xkb = {
            layout = "us";
            variant = "";
        };
        windowManager.awesome = {
            enable = true;
        };
    };
    #avahi = {enable = true;nssmdns4 = true;openFirewall = true;};
    pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;

  # Security / Polkit
  #security.rtkit.enable = true;
  #security.polkit.enable = true;

  # Optimization settings and garbage collection automation
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Extra Module Options
  # drivers.intel.enable = false;
  # local.hardware-clock.enable = false;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
