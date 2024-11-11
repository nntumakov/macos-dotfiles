{
  inputs,
  pkgs,
  lib,
  ...
}: {
  hm.home.packages = with pkgs; [
    (python3.withPackages (
      ps:
        with ps; [
          jupyter
          jupyter-core
          numpy
          scipy
          matplotlib
        ]
    ))

    rustc
    cargo

    texliveFull
    typst
    nixfmt-rfc-style
  ];

  hm.programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    extensions = let
      vm = inputs.nix-vscode-extensions.extensions.${pkgs.hostPlatform.system}.vscode-marketplace;
    in [
      # Python
      vm.ms-python.black-formatter
      vm.ms-python.debugpy
      vm.ms-python.isort
      vm.ms-python.mypy-type-checker
      vm.ms-python.python
      vm.ms-python.vscode-pylance
      vm.njpwerner.autodocstring

      # Latex
      vm.james-yu.latex-workshop

      # Jupyter
      pkgs.vscode-extensions.ms-toolsai.jupyter
      pkgs.vscode-extensions.ms-toolsai.jupyter-renderers
      vm.ms-toolsai.datawrangler

      # Other langs
      pkgs.vscode-extensions.jnoortheen.nix-ide
      vm.mechatroner.rainbow-csv
      vm.redhat.vscode-xml
      vm.redhat.vscode-yaml
      vm.tamasfe.even-better-toml
      vm.yzhang.markdown-all-in-one

      # Tools
      vm.earshinov.sort-lines-by-selection
      vm.editorconfig.editorconfig
      vm.fill-labs.dependi
      vm.stkb.rewrap
      vm.tyriar.sort-lines

      # Misc
      vm.mkhl.direnv
    ];
    userSettings = {
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = lib.getExe pkgs.nixd;
      "nix.serverSettings" = {
        nixd = {
          formatting = {
            command = ["${pkgs.alejandra}/bin/alejandra"];
          };
          options = {
            nixos = {
              expr = "(builtins.getFlake \"/Users/tumakovnikolaj/.config/nix-darwin\").darwinConfigurations.MacBook-Air-Tumakov.options";
            };
          };
        };
      };

      # Editor
      "editor.quickSuggestions" = {
        "strings" = true;
      };
      "editor.tabCompletion" = "on";
      "editor.formatOnSave" = true;
      "editor.wordWrap" = "on";

      # VCS
      "diffEditor.ignoreTrimWhitespace" = false;
      "git.autofetch" = true;
      "git.confirmSync" = false;
      "git.enableSmartCommit" = true;

      "editor.fontLigatures" = "'calt', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09', 'liga'";
      "editor.fontFamily" = "'Monaspace Neon', monospace";
      "terminal.integrated.fontFamily" = "MesloLGS NF";

      # Other
      "editor.unicodeHighlight.allowedLocales".ru = true;
      "files.autoSave" = "afterDelay";
      "redhat.telemetry.enabled" = false;
      "sortLines.filterBlankLines" = true;
      "workbench.startupEditor" = "none";
      "direnv.restart.automatic" = true;

      # Python
      "python.analysis.autoImportCompletions" = true;
      "black-formatter.path" = ["${pkgs.black}/bin/black"];
      "python.formatting.provider" = "black";
      "python.languageServer" = "Pylance";
      "mypy-type-checker.args" = ["--disable-error-code=import-untyped"];
      "mypy-type-checker.severity" = {
        "error" = "Warning";
        "note" = "Information";
      };
      # "mypy-type-checker.path" = [ "${pkgs.mypy}/bin/mypy" ];
      "python.poetryPath" = "${pkgs.poetry}/bin/poetry";
      "python.venvPath" = "~/.cache/pypoetry/virtualenvs";
      "isort.path" = ["${pkgs.python3Packages.isort}/bin/isort"];
      "python.testing.pytestEnabled" = true;
      "python.testing.pytestPath" = "${pkgs.python3Packages.pytest}/bin/pytest";

      # Rust
      "rust-analyzer.check.command" = "clippy";

      # Latex Workshop
      "latex-workshop.message.warning.show" = true;
    };
  };
}
