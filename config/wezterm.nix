{ pkgs, inputs, ... }:
let
  inherit (import ./variables.nix);
in
{
  programs = {
    wezterm = {
      enable = true;
      enableBashIntegration = true;
      extraConfig = ''
      ${builtins.readFile ./wezterm/wezterm.lua}
      '';
    };
  };
}
