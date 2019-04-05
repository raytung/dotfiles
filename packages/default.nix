{ nixpkgs ? import <nixpkgs> {} }:

rec {
  neovim = import ./neovim/default.nix {
    inherit nixpkgs;
  };

  firefox = nixpkgs.firefox-bin;
  golang = nixpkgs.go;
  rustup = nixpkgs.rustup;
  jq = nixpkgs.jq;
  tree = nixpkgs.tree;
  rg = nixpkgs.ripgrep;
  systemd = nixpkgs.systemd;
  curl = nixpkgs.curl;
  git = nixpkgs.git;
  strace = nixpkgs.strace;
  shellcheck = nixpkgs.shellcheck;
  python = nixpkgs.python3;
  pip = nixpkgs.pipenv;
  vlc = nixpkgs.vlc;
  transmission = nixpkgs.transmission;
  wireshark = nixpkgs.wireshark;
}

