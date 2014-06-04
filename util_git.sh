
# via: http://stackoverflow.com/questions/4133904/ps1-line-with-git-current-branch-and-colors

function we_are_in_git_work_tree {
  git rev-parse --is-inside-work-tree &> /dev/null
}

function parse_git_branch {
  local BR=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD 2> /dev/null)
  if [ "$BR" == HEAD ]
  then
    local NM=$(git name-rev --name-only HEAD 2> /dev/null)
    if [ "$NM" != undefined ]
    then echo -n "@$NM"
    else git rev-parse --short HEAD 2> /dev/null
    fi
  else
    echo -n $BR
  fi
}

function parse_git_status {
  local ST=$(git status --short 2> /dev/null)
  if [ -n "$ST" ]
  then echo -n "+"
  fi
}

