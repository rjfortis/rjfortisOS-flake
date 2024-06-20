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
        wofi = {
            enable = true;
            settings = {
                allow_images = true;
                prompt = "Run Programs...";
                width = "35%";
                hide_scroll = true;
                term = "wezterm";
                show = "drun";
            };
            style = ''
                * {
                    font-family: JetBrainsMono Nerd Font Mono,monospace;
                    font-weight: bold;
                }
                #window {
                    border-radius: 25px;
                    border: 2px solid #EEEEEE;
                    background: #FAFAFA};
                }
                #input {
                    border-radius: 10px;
                    border: 2px solid #EEEEEE;
                    margin: 20px;
                    padding: 15px 25px;
                    background: #FAFAFA};
                    color: #000000;
                }
                #inner-box {
                    border: none;
                    background-color: transparent;
                }
                #outer-box {
                    border: none;
                    font-weight: bold;
                    font-size: 14px;
                }
                #text {
                    border: none;
                }
                #entry {
                    margin: 10px 80px;
                    padding: 20px 20px;
                    border-radius: 10px;
                    border: none;
                }
                #entry:focus {
                    border: none;
                }
                #entry:hover {
                    border: none;
                }
                #entry:selected {
                    background-color: #FAFAFA;
                    color: #000000;
                }
            '';
        };
        bash = {
            enable = true;
            enableCompletion = true;
        };
        home-manager.enable = true;
    };
}
