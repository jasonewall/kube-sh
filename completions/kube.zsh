if [[ ! -o interactive ]]; then
    return
fi

compctl -K _kube kube

_kube() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(kube commands)"
  else
    completions="$(kube completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
