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

    # Includes all parsers for treesitter
    treesitter = {
      enable = true;
    };

    # Auto-tagging
    ts-autotag = {
      enable = true;
    };

    # Autopairs
    nvim-autopairs = {
      enable = true;
    };

    none-ls = {
      enable = true;
      enableLspFormat = false;
      updateInInsert = false;
      onAttach = ''
        function(client, bufnr)
            if client.supports_method "textDocument/formatting" then
              vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
              vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format { bufnr = bufnr }
                end,
              })
            end
          end
      '';
      sources = {
        code_actions = {
          eslint_d.enable = true;
          gitsigns.enable = true;
          statix.enable = true;
        };
        diagnostics = {
          checkstyle = {
            enable = true;
          };
          statix = {
            enable = true;
          };
          luacheck = {
            enable = true;
          };
          flake8 = {
            enable = true;
          };
          eslint_d = {
            enable = true;
          };
        };
        formatting = {
          alejandra = {
            enable = true;
          };
          prettier = {
            enable = true;
            disableTsServerFormatter = true;
            withArgs = ''
              {
                extra_args = { "--no-semi", "--single-quote" },
              }
            '';
          };
          google_java_format = {
            enable = false;
          };
          rustfmt = {
            enable = true;
          };
          stylua = {
            enable = true;
          };
          black = {
            enable = true;
            withArgs = ''
              {
                extra_args = { "--fast" },
              }
            '';
          };
          jq = {
            enable = true;
          };
        };
      };
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

    # Debugger
    dap = {
      enable = true;
      signs = {
        dapBreakpoint = {
          text = "●";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "●";
          texthl = "DapBreakpointCondition";
        };
        dapLogPoint = {
          text = "◆";
          texthl = "DapLogPoint";
        };
      };
      extensions = {
        dap-python = {
          enable = true;
        };
        dap-ui = {
          enable = true;
          floating.mappings = {
            close = ["<ESC>" "q"];
          };
        };
        dap-virtual-text = {
          enable = true;
        };
      };
      configurations = {
        java = [
          {
            type = "java";
            request = "launch";
            name = "Debug (Attach) - Remote";
            hostName = "127.0.0.1";
            port = 5005;
          }
        ];
      };
    };

    # Linting
    lint = {
      enable = true;
      lintersByFt = {
        text = ["vale"];
        json = ["jsonlint"];
        markdown = ["vale"];
        rst = ["vale"];
        ruby = ["ruby"];
        janet = ["janet"];
        inko = ["inko"];
        clojure = ["clj-kondo"];
        dockerfile = ["hadolint"];
        terraform = ["tflint"];
      };
    };

    # Trouble
    trouble = {
      enable = true;
    };

    # Code snippets
    luasnip = {
      enable = true;
      #extraConfig = {
      #  enable_autosnippets = true;
      #  store_selection_keys = "<Tab>";
      #};
    };

    # Easily toggle comments
    comment-nvim = {
      enable = true;
      sticky = true;
    };

    # Terminal inside Neovim
    toggleterm = {
      enable = true;
      autochdir = true;
      closeOnExit = true;
      direction = "vertical";
      hideNumbers = true;
    };

    # Git signs in code
    gitsigns = {
      enable = true;
      currentLineBlame = true;
    };

    which-key = {
      enable = true;
      registrations = {
        "<leader>fg" = "Find Git files with telescope";
        "<leader>fw" = "Find text with telescope";
        "<leader>ff" = "Find files with telescope";
      };
    };

    # Markdown preview server
    markdown-preview = {
      enable = true;
      theme = "dark";
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

    # Language server
    lsp = {
      enable = true;
      servers = {
        # Average webdev LSPs
        tsserver.enable = true; # TS/JS
        cssls.enable = true; # CSS
        tailwindcss.enable = true; # TailwindCSS
        html.enable = true; # HTML
        astro.enable = true; # AstroJS
        phpactor.enable = true; # PHP
        svelte.enable = false; # Svelte
        vuels.enable = false; # Vue

        # Python
        pyright.enable = true;

        # Markdown
        marksman.enable = true;

        # Nix
        nil_ls.enable = true;

        # Docker
        dockerls.enable = true;

        # Bash
        bashls.enable = true;

        # C/C++
        clangd.enable = true;

        # C#
        csharp-ls.enable = true;

        # Lua
        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
        };

        # Rust
        rust-analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
      };
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

  extraConfigLua = ''
      luasnip = require("luasnip")
      kind_icons = {
        Text = "󰊄",
        Method = "",
        Function = "󰡱",
        Constructor = "",
        Field = "",
        Variable = "󱀍",
        Class = "",
        Interface = "",
        Module = "󰕳",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }

    local cmp = require'cmp'

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({'/', "?" }, {
          sources = {
          { name = 'buffer' }
          }
          })

    -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
          sources = cmp.config.sources({
              { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
              }, {
              { name = 'buffer' },
              })
          })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
          sources = cmp.config.sources({
              { name = 'path' }
              }, {
              { name = 'cmdline' }
              }),
          })  '';

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

  # extraPlugins = with pkgs.vimPlugins; [
  #   vim-be-good
  #   headlines-nvim
  #   # accelerated-jk
  # ];

  extraPlugins = with pkgs.vimPlugins;
    [
      vim-be-good
      headlines-nvim # Should load this in at the opening of filetypes that require this, namely Markdown.
      nvim-web-devicons # Should load this in at Telescope/Neotree actions.
      friendly-snippets # Should load this in at LuaSnip's initialisation, no clue how tho yet...
    ]
    ++ [
      # (pkgs.vimUtils.buildVimPlugin {
      #   pname = "accelerated-jk";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "rainbowhxch";
      #     repo = "accelerated-jk.nvim";
      #     rev = "8fb5dad4ccc1811766cebf16b544038aeeb7806f";
      #     sha256 = "";
      #   };
      #   version = "2023-03-01";
      # })
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
}
