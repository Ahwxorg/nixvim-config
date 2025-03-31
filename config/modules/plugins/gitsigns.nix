{ ... }:
{
  plugins.gitsigns = {
    enable = true;
    settings = {
      current_line_blame = true;
      current_line_blame_formatter = "   <author>, <committer_time:%R> • <summary>";
    };
  };
}
