{
  config,
  pkgs,
  host,
  inputs,
  options,
  ...
}:
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
