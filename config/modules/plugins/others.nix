{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    vim-be-good
    glow-nvim # Glow inside of Neovim
    clipboard-image-nvim # This might work with emails, not too sure?
    #]
    #++ [
    #  (pkgs.vimUtils.buildVimPlugin {
    #    pname = "himalaya-vim";
    #    version = "0.0.1";
    #    src = pkgs.fetchFromGitHub {
    #      owner = "pimalaya";
    #      repo = "himalaya-vim";
    #      rev = "";
    #      hash = "";
    #    };
    #  })
    # Just copy this block for a new plugin
    # (pkgs.vimUtils.buildVimPlugin {
    #   pname = "";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "";
    #     repo = "";
    #     rev = "";
    #     sha256 = "";
    #   };
    # })
  ];
  extraPackages = with pkgs; [ himalaya ];
}
