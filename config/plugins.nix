{pkgs, ...}: {
  plugins = {
    # Buffer bar
    bufferline = {
      enable = true;
    };

    # Status bar
    lualine = {
      enable = true;
    };

    # Make `nvim .` look prettier
    oil = {
      enable = true;
    };

    # Notify
    notify = {
      enable = true;
      backgroundColour = "#1e1e2e";
      fps = 60;
      render = "default";
      timeout = 500;
      topDown = true;
    };

    # Prettier fancier command window
    noice = {
      enable = true;
    };

    # Good old Telescope
    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
      };
    };

    # Todo comments
    todo-comments = {
      enable = true;
      colors = {
        error = ["DiagnosticError" "ErrorMsg" "#DC2626"];
        warning = ["DiagnosticWarn" "WarningMsg" "#FBBF24"];
        info = ["DiagnosticInfo" "#2563EB"];
        hint = ["DiagnosticHint" "#10B981"];
        default = ["Identifier" "#7C3AED"];
        test = ["Identifier" "#FF00FF"];
      };
    };

    # File tree
    neo-tree = {
      enable = true;
      enableDiagnostics = true;
      enableGitStatus = true;
      enableModifiedMarkers = true;
      enableRefreshOnWrite = true;
      closeIfLastWindow = true;
      popupBorderStyle = "rounded"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
      buffers = {
        bindToCwd = false;
        followCurrentFile = {
          enabled = true;
        };
      };
      window = {
        width = 40;
        height = 15;
        autoExpandWidth = false;
        mappings = {
          "<space>" = "none";
        };
      };
    };

    # Nix expressions in Neovim
    nix = {
      enable = true;
    };

    # Dashboard
    alpha = {
      enable = true;
      theme = "dashboard";
      iconsEnabled = true;
    };

    cmp-nvim-lsp = {
      enable = true; # Enable suggestions for LSP
    };
    cmp-buffer = {
      enable = true; # Enable suggestions for buffer in current file
    };
    cmp-path = {
      enable = true; # Enable suggestions for file system paths
    };
    cmp_luasnip = {
      enable = true; # Enable suggestions for code snippets
    };
    cmp-cmdline = {
      enable = false; # Enable autocomplete for command line
    };
  };

  colorschemes.catppuccin = {
    enable = true;
    disableBold = false;
    disableItalic = false;
    disableUnderline = false;
    transparentBackground = false;
    integrations = {
      cmp = true;
      noice = true;
      notify = true;
      neotree = true;
      harpoon = true;
      gitsigns = true;
      which_key = true;
      illuminate.enabled = true;
      treesitter = true;
      treesitter_context = true;
      telescope.enabled = true;
      indent_blankline.enabled = true;
      mini.enabled = true;
      native_lsp = {
        enabled = true;
        inlay_hints = {
          background = true;
        };
        underlines = {
          errors = ["underline"];
          hints = ["underline"];
          information = ["underline"];
          warnings = ["underline"];
        };
      };
    };
  };

  keymaps = [
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fw";
    }
    {
      mode = "n";
      key = "<leader>un";
      action = ''
        <cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>
      '';
      options = {
        desc = "Dismiss All Notifications";
      };
    }
  ];
  # extraConfigLua = ''
  #   local notify = require("notify")
  #   local filtered_message = { "No information available" }

  #   -- Override notify function to filter out messages
  #   ---@diagnostic disable-next-line: duplicate-set-field
  #   vim.notify = function(message, level, opts)
  #   	local merged_opts = vim.tbl_extend("force", {
  #   		on_open = function(win)
  #   			local buf = vim.api.nvim_win_get_buf(win)
  #   			vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
  #   		end,
  #   	}, opts or {})

  #   	for _, msg in ipairs(filtered_message) do
  #   		if message == msg then
  #   			return
  #   		end
  #   	end
  #   	return notify(message, level, merged_opts)
  #   end
  # '';
}
