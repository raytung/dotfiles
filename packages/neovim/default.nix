{ nixpkgs }:

nixpkgs.neovim.override {
  vimAlias = true;
  configure = {
    customRC = builtins.readFile ./vimrc;

    plug.plugins = with nixpkgs.vimPlugins;
    [
      deoplete-nvim
      rust-vim
      deoplete-rust
      vim-go
      nerdtree
      vim-commentary
      vim-fugitive
      vim-surround
      vim-airline
      vim-airline-themes
      ctrlp-vim
      auto-pairs
      vim-nix
      vim-better-whitespace
      vim-gitgutter
      vim-sensible
      vim-racer
      deol-nvim
      neosnippet-vim
      neosnippet-snippets
    ];
  };
}
