_project-dir() {
    git rev-parse --show-toplevel 2>/dev/null
}

_git-dir() {
    git rev-parse --git-dir 2>/dev/null
}
