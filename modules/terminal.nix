{
  inputs,
  pkgs,
  lib,
  ...
}: {
  hm.home.packages = with pkgs; [
    tmux
  ];

  hm.programs.alacritty = {
    enable = true;
    settings = {
      shell = {
        program = "${pkgs.zsh}/bin/zsh";
      };
    };
  };
}
