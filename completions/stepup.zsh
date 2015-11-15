if [[ ! -o interactive ]]; then
    return
fi

compctl -K _stepup stepup

_stepup() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(stepup commands)"
  else
    completions="$(stepup completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
