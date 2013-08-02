_version_tags() {
    git tag | grep --color=never $(_mask2re)
}
