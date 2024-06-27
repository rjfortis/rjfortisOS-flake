{ pkgs, inputs, ... }:
let
    inherit (import ./variables.nix);
in
{
    programs = {
        wezterm = {
            enable = true;
            enableBashIntegration = true;
            extraLuaConfig = ''
                ${builtins.readFile ./wezterm/wezterm.lua}
            '';
        };
    };
}
