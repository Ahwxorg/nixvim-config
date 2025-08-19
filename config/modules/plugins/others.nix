{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    vim-be-good
    glow-nvim # Glow inside of Neovim
    clipboard-image-nvim # This might work with emails, not too sure?
    nvim-biscuits
    # ]
    #++ [
    #  (pkgs.vimUtils.buildVimPlugin {
    #    pname = "nvim-biscuits";
    #    version = "0.0.1";
    #    src = pkgs.fetchFromGitHub {
    #      owner = "code-biscuits";
    #      repo = "nvim-biscuits";
    #      rev = "ff1d12c8b47cd28723da593b2cfa2e98391d439a";
    #      sha256 = "18dvvg32nxrdp1ydbvxrzkdg7q214naq2bphs7y1s9zmjhyj25pm";
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
