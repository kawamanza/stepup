if ! type git >/dev/null 2>&1; then
    die "git: command not found"
fi

if ! git rev-parse >/dev/null 2>&1; then
    die "Not a git repository (or any of the parent directory): $(pwd)"
fi

_project-dir() {
    git rev-parse --show-toplevel 2>/dev/null
}
