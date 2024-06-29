{ 
  pkgs, 
  inputs, 
  ... 
}:
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
