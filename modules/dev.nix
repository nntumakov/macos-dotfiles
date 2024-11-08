{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim
  ];

  hm = {
    programs.git = {
      enable = true;
      lfs.enable = true;
      delta.enable = true;

      userName = "Tumakov Nikolay";
      userEmail = "nntumakov@icloud.com";

      extraConfig = {
        #   core.editor = "micro";
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
      };
    };

    programs.eza = {
      enable = true;
    };

    programs.zsh.shellAliases = {
      ls = "eza --icons -l";
      la = "eza --icons -la";
      lt = "eza --icons --tree";
    };
  };

  hm.programs.direnv.enable = true;
}
