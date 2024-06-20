{
    config,
    pkgs,
    inputs,
    username,
    host,
    ...
}:
let
    inherit (import ./variables.nix)
        gitUsername
        gitEmail
        ;
in
{
    # Home Manager Settings
    home.username = "${username}";
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "23.11";

    #Import Program Configurations
    imports = [
        ../../config/rofi/rofi.nix
        #../../config/rofi/config-emoji.nix
        ../../config/rofi/config-long.nix
    ];

    # Place Files Inside Home Directory
    home.file."Pictures/Wallpapers" = {
        source = ../../config/wallpapers;
        recursive = true;
    };
    home.file.".local/share/fonts" = {
        source = ../../config/fonts;
        recursive = true;
    };

    # Install & Configure GIT
    programs.git = {
        enable = true;
        userName = "${gitUsername}";
        userEmail = "${gitEmail}";
    };

    # home.pointerCursor = {};

    # Scripts
    # home.packages = [(import ../../scripts/rofi-launcher.nix { inherit pkgs; })];

    # Scripts
    home.packages = [
        (import ../../scripts/rofi-launcher.nix { inherit pkgs; })
    ];

    programs = {
        neovim = {
            enable = true;
            defaultEditor = true;
        };
        bash = {
            enable = true;
            enableCompletion = true;
        };
        home-manager.enable = true;
    };
}
