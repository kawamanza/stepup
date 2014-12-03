#!/usr/bin/env bash

[ $# -eq 0 ] && eval set -- version show

declare PROGRAM_NAME=$(basename $0)
PROGRAM_VERSION=1.0.0.alpha1

show_program_version() {
    printf "%s, version %s\n" "$PROGRAM_NAME" "$PROGRAM_VERSION"
}

show_usage() {
    echo "Usage:"
    echo "  $PROGRAM_NAME [global options]"
    echo "  $PROGRAM_NAME <subcommand>"
    echo "  $PROGRAM_NAME # same as \`$PROGRAM_NAME version show\`"
    echo "  $PROGRAM_NAME help <subcommand>"
    echo
    echo "Global Options:"
    echo
    echo "  -v  Display $PROGRAM_NAME version"
    echo "  -h  Display usage"
    echo
    echo "Available subcommands:"
    echo
    echo "  help     Display subcommands usage"
    echo "  notes    Manage project's release notes"
    echo "  version  Manage project's semantic versioning"
    echo
}

die() {
    echo $1 >&2
    exit 1
}

# get the root folder
get_stepup_dir() {
    local _dir
    if [ -d $HOME/.stepup ]; then
        echo $HOME/.stepup/lib
        return 0
    fi
    _dir=$(dirname $0)
    if [ "$_dir" == "." ]; then
        _dir=".."
    else
        _dir=$(dirname $_dir)
    fi
    if [ -d $_dir/lib/stepup/lib ]; then
        echo $_dir/lib/stepup/lib
    else
        die "could not define stepup instalation directory"
    fi
}
if [ -z "$STEPUP_ROOT" ]; then
    declare STEPUP_ROOT=$(get_stepup_dir)
    ([ $? -ne 0 ] || [ -z "$STEPUP_ROOT" ]) && exit 1
fi

declare SUB_COMMAND=""
case $1 in
    version|notes|init|help)
        SUB_COMMAND="$1"
        shift
    ;;
esac

if [ "$SUB_COMMAND" = "help" ] && [ $# -eq 0 ]; then
    unset SUB_COMMAND
    set -- -h
fi

if [ -z "$SUB_COMMAND" ]; then
    while getopts ":vhM" opt; do
        case $opt in
            h)
                show_usage
                exit 0
                ;;
            v)
                show_program_version
                exit 0
                ;;
            \?)
                if [ "$OPTARG" == "-" ]; then
                    opt=$(eval echo \$$OPTIND)
                    case $opt in
                        --version)
                            show_program_version
                            exit 0
                        ;;
                        *)
                            OPTARG=${opt#-}
                        ;;
                    esac
                fi
                die "Invalid option: -$OPTARG"
                ;;
            :)
                die "Option -$OPTARG requires an argument."
                ;;
        esac
    done
    SUB_COMMAND="${1:-version}"
fi

if [ ! -f $STEPUP_ROOT/$SUB_COMMAND.sh ]; then
    die "Invalid sub-command: $SUB_COMMAND"
fi

source $STEPUP_ROOT/$SUB_COMMAND.sh
