source $STEPUP_ROOT/_git_check.sh

SUB_COMMAND=$1
case $1 in
    help|tags)
        shift
        source $STEPUP_ROOT/version-$SUB_COMMAND.sh
    ;;
    *)
        # source $STEPUP_ROOT/version-show.sh
    ;;
esac
