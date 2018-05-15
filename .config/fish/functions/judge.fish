# Inspired by: https://dockyard.com/blog/2018/05/11/tell-me-when-it-s-finished
# Usage:
# - with args, `judge mix test`; runs `yay` or `boom`
#   depending on exit status of given command
# - without args, `mix test; judge`; runs `yay` or `boom`
#   depending on exit status of previous command
function judge
  set last_exit_status $status
  set number_of_args (count $argv)

  if test $number_of_args -gt 0
    # - treat the args as a command to run
    # - $argv is all the args given
    # - `"$argv"` makes sure that quoting is preserved;
    #     eg, if the command was `judge echo one "two three"`,
    #     `echo` will get two args, not three
    # - Once the expansion is done, the shell sees a bare
    #   command and runs it.
    eval "$argv"
    and yay
    or boom
  else
    # No args given means no command to run, so check the exit
    # status of the last command and notify accordingly
    test $last_exit_status -eq 0
    and yay
    or boom
  end
end
