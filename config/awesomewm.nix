{ pkgs, inputs, ... }:
let
  inherit (import ./variables.nix);
in
{
  services = {
    xserver = {
      windowManager.awesome = {
        enable = true;
        extraConfig = ''
        ${builtins.readFile ./awesomewm/awesomewm.lua}
        '';
      };
    };
  };
}
