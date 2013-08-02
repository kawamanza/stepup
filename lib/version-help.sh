show_version_tags_usage() {
    echo "Usage:"
    echo "  $PROGRAM_NAME version tags"
    echo
}

case $1 in
    tags)
        show_version_tags_usage
        exit 0
    ;;
    *)
        die "Invalid sub-command: $1"
    ;;
esac
