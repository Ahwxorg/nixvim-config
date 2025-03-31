{ lib, pkgs, ... }: {
  plugins = {
    lsp-format = {
      enable = true;
    };
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        nixd = {
          enable = true;
          settings =
            let
              flake = ''(builtins.getFlake "github:elythh/flake)""'';
              flakeNixvim = ''(builtins.getFlake "github:elythh/nixvim)""'';
            in
            {
              nixpkgs = {
                expr = "import ${flake}.inputs.nixpkgs { }";
              };
              formatting = {
                command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
              };
              options = {
                nixos.expr = ''${flake}.nixosConfigurations.grovetender.options'';
                nixvim.expr = ''${flakeNixvim}.packages.${pkgs.system}.default.options'';
              };
            };
        };
        yamlls = {
          enable = true;
          settings = {
            schemaStore = {
              enable = false;
              url = "";
            };
          };
        };
        # ltex = {
        #   enable = true;
        #   settings = {
        #     enabled = [ "astro" "html" "latex" "markdown" "text" "tex" "gitcommit" ];
        #     completionEnabled = true;
        #     language = "en-US de-DE nl";
        #     # dictionary = {
        #     #   "nl-NL" = [
        #     #     ":/home/liv/.local/share/nvim/ltex/nl-NL.txt"
        #     #   ];
        #     #   "en-US" = [
        #     #     ":/home/liv/.local/share/nvim/ltex/en-US.txt"
        #     #   ];
        #     #   "de-DE" = [
        #     #     ":/home/liv/.local/share/nvim/ltex/de-DE.txt"
        #     #   ];
        #     # };
        #   };
        # };
        gopls = { # Golang
          enable = true;
          autostart = true;
        };
       
        lua_ls = { # Lua
          enable = true;
          settings.telemetry.enable = false;
        };
       
        # Rust
        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        ts_ls.enable = true; # TS/JS
        cssls.enable = true; # CSS
        tailwindcss.enable = true; # TailwindCSS
        html.enable = true; # HTML
        astro.enable = true; # AstroJS
        phpactor.enable = true; # PHP
        svelte.enable = false; # Svelte
        vuels.enable = false; # Vue
        pyright.enable = true; # Python
        nil_ls.enable = true; # Nix
        dockerls.enable = true; # Docker
        bashls.enable = true; # Bash
        clangd.enable = true; # C/C++
        csharp_ls.enable = true; # C#
        markdown_oxide.enable = true; # Markdown
      };

      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          # Use LSP saga keybinding instead
          # K = {
          #   action = "hover";
          #   desc = "Hover";
          # };
          # "<leader>cw" = {
          #   action = "workspace_symbol";
          #   desc = "Workspace Symbol";
          # };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        # diagnostic = {
        #   "<leader>cd" = {
        #     action = "open_float";
        #     desc = "Line Diagnostics";
        #   };
        #   "[d" = {
        #     action = "goto_next";
        #     desc = "Next Diagnostic";
        #   };
        #   "]d" = {
        #     action = "goto_prev";
        #     desc = "Previous Diagnostic";
        #   };
        # };
      };
    };
  };
  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }

    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end;
  '';
}
