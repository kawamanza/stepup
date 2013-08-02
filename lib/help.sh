show_version_usage() {
    echo "Usage:"
    echo "  $PROGRAM_NAME version <subcommand>"
    echo "  $PROGRAM_NAME version # same as \`$PROGRAM_NAME version show\`"
    echo "  $PROGRAM_NAME version help <subcommand>"
    echo
    echo "Available subcommands:"
    echo
    # echo "  help     Display subcommands usage"
    echo "  show     Display current version and revision"
    # echo "  current  Display last version increased"
    echo "  tags     Dislpay all semantic version tags"
    # echo "  create   Increase project version"
    echo
}

case $1 in
    version)
        show_version_usage
        exit 0
    ;;
    *)
        die "Invalid sub-command: $1"
    ;;
esac
