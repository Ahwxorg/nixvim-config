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
      cmd = ["bash -c nvim"];
      debug = true;
      sources = {
        code_actions = {
          statix.enable = true;
          gitsigns.enable = true;
        };
        diagnostics = {
          statix.enable = true;
          deadnix.enable = true;
          pylint.enable = true;
          checkstyle.enable = true;
        };
        formatting = {
          alejandra.enable = true;
          stylua.enable = true;
          shfmt.enable = true;
          nixpkgs_fmt.enable = true;
          google_java_format.enable = false;
          prettier = {
            enable = true;
            disableTsServerFormatter = true;
          };
          black = {
            enable = true;
            withArgs = ''
              {
                extra_args = { "--fast" },
              }
            '';

          };
        };
        completion = {
          luasnip.enable = true;
          spell.enable = true;
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
    # comment = {
    #   enable = true;
    #   # settings.sticky = true;
    # };

    # Terminal inside Neovim
    toggleterm = {
      enable = true;
      settings = {
        hide_numbers = false;
        autochdir = true;
        close_on_exit = true;
        direction = "vertical";
      };
    };

    # Git signs in code
    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
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
      settings.theme = "dark";
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

    cmp.enable = true;

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
    settings = {
      no_bold = false;
      no_italic = false;
      no_underline = false;
      transparent_background = true;
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
            })
  require("headlines").setup {
      markdown = {
          query = vim.treesitter.query.parse(
              "markdown",
              [[
                  (atx_heading [
                      (atx_h1_marker)
                      (atx_h2_marker)
                      (atx_h3_marker)
                      (atx_h4_marker)
                      (atx_h5_marker)
                      (atx_h6_marker)
                  ] @headline)

                  (thematic_break) @dash

                  (fenced_code_block) @codeblock

                  (block_quote_marker) @quote
                  (block_quote (paragraph (inline (block_continuation) @quote)))
                  (block_quote (paragraph (block_continuation) @quote))
                  (block_quote (block_continuation) @quote)
              ]]
          ),
          headline_highlights = { "Headline" },
          bullet_highlights = {
              "@text.title.1.marker.markdown",
              "@text.title.2.marker.markdown",
              "@text.title.3.marker.markdown",
              "@text.title.4.marker.markdown",
              "@text.title.5.marker.markdown",
              "@text.title.6.marker.markdown",
          },
          bullets = { "◉", "○", "✸", "✿" },
          codeblock_highlight = "CodeBlock",
          dash_highlight = "Dash",
          dash_string = "-",
          quote_highlight = "Quote",
          quote_string = "┃",
          fat_headlines = true,
          fat_headline_upper_string = "▃",
          fat_headline_lower_string = "🬂",
      },
      rmd = {
          query = vim.treesitter.query.parse(
              "markdown",
              [[
                  (atx_heading [
                      (atx_h1_marker)
                      (atx_h2_marker)
                      (atx_h3_marker)
                      (atx_h4_marker)
                      (atx_h5_marker)
                      (atx_h6_marker)
                  ] @headline)

                  (thematic_break) @dash

                  (fenced_code_block) @codeblock

                  (block_quote_marker) @quote
                  (block_quote (paragraph (inline (block_continuation) @quote)))
                  (block_quote (paragraph (block_continuation) @quote))
                  (block_quote (block_continuation) @quote)
              ]]
          ),
          treesitter_language = "markdown",
          headline_highlights = { "Headline" },
          bullet_highlights = {
              "@text.title.1.marker.markdown",
              "@text.title.2.marker.markdown",
              "@text.title.3.marker.markdown",
              "@text.title.4.marker.markdown",
              "@text.title.5.marker.markdown",
              "@text.title.6.marker.markdown",
          },
          bullets = { "◉", "○", "✸", "✿" },
          codeblock_highlight = "CodeBlock",
          dash_highlight = "Dash",
          dash_string = "-",
          quote_highlight = "Quote",
          quote_string = "┃",
          fat_headlines = true,
          fat_headline_upper_string = "▃",
          fat_headline_lower_string = "🬂",
      },
      norg = {
          query = vim.treesitter.query.parse(
              "norg",
              [[
                  [
                      (heading1_prefix)
                      (heading2_prefix)
                      (heading3_prefix)
                      (heading4_prefix)
                      (heading5_prefix)
                      (heading6_prefix)
                  ] @headline

                  (weak_paragraph_delimiter) @dash
                  (strong_paragraph_delimiter) @doubledash

                  ([(ranged_tag
                      name: (tag_name) @_name
                      (#eq? @_name "code")
                  )
                  (ranged_verbatim_tag
                      name: (tag_name) @_name
                      (#eq? @_name "code")
                  )] @codeblock (#offset! @codeblock 0 0 1 0))
  
                  (quote1_prefix) @quote
              ]]
          ),
          headline_highlights = { "Headline" },
          bullet_highlights = {
              "@neorg.headings.1.prefix",
              "@neorg.headings.2.prefix",
              "@neorg.headings.3.prefix",
              "@neorg.headings.4.prefix",
              "@neorg.headings.5.prefix",
              "@neorg.headings.6.prefix",
          },
          bullets = { "◉", "○", "✸", "✿" },
          codeblock_highlight = "CodeBlock",
          dash_highlight = "Dash",
          dash_string = "-",
          doubledash_highlight = "DoubleDash",
          doubledash_string = "=",
          quote_highlight = "Quote",
          quote_string = "┃",
          fat_headlines = true,
          fat_headline_upper_string = "▃",
          fat_headline_lower_string = "🬂",
      },
      org = {
          query = vim.treesitter.query.parse(
              "org",
              [[
                  (headline (stars) @headline)

                  (
                      (expr) @dash
                      (#match? @dash "^-----+$")
                  )

                  (block
                      name: (expr) @_name
                      (#match? @_name "(SRC|src)")
                  ) @codeblock

                  (paragraph . (expr) @quote
                      (#eq? @quote ">")
                  )
              ]]
          ),
          headline_highlights = { "Headline" },
          bullet_highlights = {
              "@org.headline.level1",
              "@org.headline.level2",
              "@org.headline.level3",
              "@org.headline.level4",
              "@org.headline.level5",
              "@org.headline.level6",
              "@org.headline.level7",
              "@org.headline.level8",
          },
          bullets = { "◉", "○", "✸", "✿" },
          codeblock_highlight = "CodeBlock",
          dash_highlight = "Dash",
          dash_string = "-",
          quote_highlight = "Quote",
          quote_string = "┃",
          fat_headlines = true,
          fat_headline_upper_string = "▃",
          fat_headline_lower_string = "🬂",
      },
  }'';

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
      glow-nvim # Glow inside of Neovim
      ultisnips
      clipboard-image-nvim
      comment-nvim
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
