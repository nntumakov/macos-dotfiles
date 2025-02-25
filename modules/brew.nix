{...}: {
  homebrew = {
    enable = true;

    brews = [
      "clang-format"
      "cmake"
      "llvm"
      "ninja"
    ];
    
    casks = [
      "alacritty"
      "chatgpt"
      "kitty"
      "logseq"
      "obs"
      "syncthing"
      "thunderbird"
      "obsidian"
      "telegram"
    ];
  };
}
