_version_tags() {
    git tag | xargs -I@ git log --format=format:"%ai @%n" -1 @ | sort | awk '{print $4}' | grep --color=never $(_mask2re)
}
