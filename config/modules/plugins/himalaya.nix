{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    himalaya-vim
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
