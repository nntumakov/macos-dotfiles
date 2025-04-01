{pkgs, ...}: {
  hm = {
    home.packages = with pkgs; [
      (python3.withPackages (
        ps:
          with ps; [
            jupyter
            matplotlib
            numpy
            pytest
            scipy
          ]
      ))

      clang
      cmake
      cmake-format

      cargo
      rustc

      texliveFull
      typst

      nixfmt-rfc-style
      tex-fmt

      nodejs_23

      pre-commit
    ];

    programs.git = {
      enable = true;
      lfs.enable = true;
      delta.enable = true;

      userName = "Tumakov Nikolay";
      userEmail = "nntumakov@icloud.com";

      extraConfig = {
        init.defaultBranch = "master";
        pull.rebase = true;
        push.autoSetupRemote = true;
      };
    };

    programs.direnv.enable = true;
  };
}
