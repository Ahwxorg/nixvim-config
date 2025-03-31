{ pkgs, ... }: {
  plugins = {
    treesitter = {
      enable = true;

      settings = {
        indent = {
          enable = true;
        };
        highlight = {
          enable = true;
        };
      };

      nixvimInjections = true;
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };

    treesitter-context = {
      enable = false;
    };

    treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        lookahead = true;
      };
    };
  };
  extraConfigLua = ''
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  '';
}

