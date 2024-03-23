{self, ...}: {
  globalOptions = {
    number = true;
    relativenumber = true;

    shiftwidth = 2;
    scrolloff = 5;
  };

  globals.mapleader = " ";

  # autoCmd = [
  #   {
  #     event = [ "BufEnter" "BufWinEnter" ];
  #     pattern = [ "*.c" "*.h" ];
  #     command = [ "echo 'Entering a C or C++ file" ];
  #   }
  # ];

  highlight = {
    Comment.fg = "#ff00ff";
    Comment.bg = "#000000";
    Comment.underline = true;
    Comment.bold = true;
  };
}
