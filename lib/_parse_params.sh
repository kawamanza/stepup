#!/bin/bash -x

declare -a errors
declare -a args

while [ $# -gt 0 ]
do
  case $1 in
  # Normal option processing
    -v | -version)
      args+=("-v")
      ;;
    -h | --help)
      args+=("-h $2")
      shift
      ;;
    notes)
      args+=("notes $*")
      break
      ;;
  # Special cases
    --)
      break
      ;;
    --* | -?)
      errors+=($1)
      ;;
  # Split apart combined short options
    -*)
      split=$1
      shift
      set -- $(echo "$split" | cut -c 2- | sed 's/./-& /g') "$@"
      continue
      ;;
  # Done with options
    *)
      break
      ;;
  esac
  shift
done