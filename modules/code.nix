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
          matplotlib
          numpy
          scipy
        ]
    ))

    cargo
    rustc

    texliveFull
    typst

    nixfmt-rfc-style
    tex-fmt

    nodejs_23
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

      # cpp
      vm.ms-vscode.cmake-tools

      # Latex
      vm.james-yu.latex-workshop
      vm.orangex4.latex-sympy-calculator

      # Jupyter
      vm.ms-toolsai.datawrangler
      vm.ms-toolsai.jupyter
      vm.ms-toolsai.jupyter-renderers

      # Other langs
      vm.jnoortheen.nix-ide
      vm.mechatroner.rainbow-csv
      vm.redhat.vscode-xml
      vm.redhat.vscode-yaml
      vm.richie5um2.vscode-sort-json
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

      "editor.fontFamily" = "'Monaspace Neon', monospace";
      "editor.fontLigatures" = "'calt', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09', 'liga'";
      "terminal.integrated.fontFamily" = "MesloLGS NF";

      # Other
      "direnv.restart.automatic" = true;
      "editor.unicodeHighlight.allowedLocales".ru = true;
      "files.autoSave" = "afterDelay";
      "redhat.telemetry.enabled" = false;
      "sortLines.filterBlankLines" = true;
      "workbench.startupEditor" = "none";

      # Python
      "black-formatter.path" = ["${pkgs.black}/bin/black"];
      "mypy-type-checker.args" = ["--disable-error-code=import-untyped"];
      "python.analysis.autoImportCompletions" = true;
      "python.formatting.provider" = "black";
      "python.languageServer" = "Pylance";
      "mypy-type-checker.severity" = {
        "error" = "Warning";
        "note" = "Information";
      };
      # "mypy-type-checker.path" = [ "${pkgs.mypy}/bin/mypy" ];
      "isort.path" = ["${pkgs.python3Packages.isort}/bin/isort"];
      "python.poetryPath" = "${pkgs.poetry}/bin/poetry";
      "python.testing.pytestEnabled" = true;
      "python.testing.pytestPath" = "${pkgs.python3Packages.pytest}/bin/pytest";
      "python.venvPath" = "~/.cache/pypoetry/virtualenvs";

      # Rust
      "rust-analyzer.check.command" = "clippy";

      # Latex Workshop
      "latex-sympy-calculator.mac" = "/Users/tumakovnikolaj/Private/tex-doc-rep/.venv/bin/python3";
      "latex-workshop.formatting.latex" = "tex-fmt";
      "latex-workshop.latex.autoBuild.run" = "never";
      "latex-workshop.message.warning.show" = true;

      # CMake
      "cmake.cmakePath" = "/opt/homebrew/bin/cmake";
      "cmake.pinnedCommands" = [
        "workbench.action.tasks.configureTaskRunner"
        "workbench.action.tasks.runTask"
      ];
      "cmake.showOptionsMovedNotification" = false;
    };
  };
}
