{
  pkgs, 
  inputs, 
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
