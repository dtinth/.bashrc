
_set_color() {
  echo -n '\['
  tput setaf $1
  echo -n '\]'
}

_bash_ps1() {
  _set_color 226
  echo -n '\u♕ '
  _set_color 51
  echo -n '\w '
  _set_color 120
  echo -n '▹ '
  echo -n $'\[\e[m\]'
}

PS1=$(_bash_ps1)
