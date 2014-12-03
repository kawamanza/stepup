_project-dir() {
    git rev-parse --show-toplevel 2>/dev/null
}

_git-dir() {
    git rev-parse --git-dir 2>/dev/null
}

_array_contains() { 
    local array="$1[@]"
    local seeking=$2
    local in=1
    for element in "${!array}"; do
        if [[ $element == $seeking ]]; then
            in=0
            break
        fi
    done
    return $in
}

debug() {
    local name=args
    if [ $# -gt 1 ]; then
      name=$1
      shift
    fi
    if _array_contains $name "-d"; then
        echo "[DEBUG] $1"
    fi
}
