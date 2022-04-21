function print_optional_host
  if test -n "$SSH_CLIENT"
    set_color purple
    printf (hostname)': '
  end
end

function print_git_branch
  set git_status (git status --porcelain 2> /dev/null)
  set git_branch (git rev-parse --abbrev-ref HEAD 2> /dev/null)

  if test $status -ne 0
    return
  end

  if test -z "$git_status"
    set_color green
  else
    set_color red
  end

  printf $git_branch' '
end

function fish_prompt
  print_optional_host
  print_git_branch

  set_color blue
  printf (prompt_pwd)' '

  set_color yellow
  printf '» '

  set_color normal
end
