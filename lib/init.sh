source $STEPUP_ROOT/_git_check.sh

if [ -f $(_project-dir)/.stepup ]; then
    die "The config file ./.stepup is alread present"
else
    cp $STEPUP_ROOT/template/.stepup $(_project-dir) || exit 1
fi
