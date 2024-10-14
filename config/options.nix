{self, ...}: {
  globalOpts = {
    # Line numbers
    number = true;
    relativenumber = true;

    # Always show the signcolumn, otherwise text would be shifted when displaying error icons
    signcolumn = "yes";

    # Enable mouse
    mouse = "a";

    # Search
    ignorecase = true;
    smartcase = true;
  
    # Configure how new splits should be opened
    splitright = true;
    splitbelow = true;

    list = true;
    # NOTE: .__raw here means that this field is raw lua code
    listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

    # Tab defaults (might get overwritten by an LSP server)
    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 0;
    expandtab = true;
    smarttab = true;

    # System clipboard support, needs xclip/wl-clipboard
    clipboard = {
      providers = {
        wl-copy.enable = true; # Wayland 
        xsel.enable = true; # For X11
      };
      register = "unnamedplus";
    };

    # Save undo history
    undofile = true;


    # Highlight the current line for cursor
    cursorline = true;

    # Show line and column when searching
    ruler = true;

    # Global substitution by default
    gdefault = true;

    # Start scrolling when the cursor is X lines away from the top/bottom
    scrolloff = 5;
  };

  userCommands = {
    Q.command = "q";
    Q.bang = true;
    Wq.command = "q";
    Wq.bang = true;
    WQ.command = "q";
    WQ.bang = true;
    W.command = "q";
    W.bang = true;
  };

  globals.mapleader = " ";

  autoCmd = [
    {
      event = [ "VimEnter" ];
      callback = { __raw = "function() if vim.fn.argv(0) == '' then require('telescope.builtin').find_files() end end"; };
    }
  ];
  #autoCmd = [
  #  {
  #    event = [ "BufEnter" "BufWinEnter" ];
  #    pattern = [ "*.md" "*.mdx" ];
  #    command = "MarkdownPreviewToggle";
  #  }
  #];

  highlight = {
    Comment.fg = "#ff00ff";
    Comment.bg = "#000000";
    Comment.underline = true;
    Comment.bold = true;
  };
}
