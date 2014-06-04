
_set_color() {
  echo -n '\['
  tput setaf $1
  echo -n '\]'
}

function _bash_ps1_git {
  if we_are_in_git_work_tree
  then
    echo -n '('
    parse_git_branch
    parse_git_status
    echo -n ')'
  fi
}

_bash_ps1() {

  _set_color 226
  echo -n '\u♕ '

  _set_color 51
  echo -n '\w'

  _set_color 211
  echo -n '$(_bash_ps1_git)'

  _set_color 120
  echo -n '\['
  tput bold
  echo -n '\]'
  echo -n ' ▹ '

  echo -n $'\\[\e[m\\]'
}

PS1=$(_bash_ps1)

