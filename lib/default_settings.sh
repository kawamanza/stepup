STEPUP_ARCHIVING_SECTION="versioning"
STEPUP_ARCHIVING_MESSAGE="available on {release}"
source $STEPUP_ROOT/_support.sh
source $STEPUP_ROOT/_utils.sh

if [ -f "$(_project-dir)/.stepup" ]; then
    source "$(_project-dir)/.stepup"
fi

declare_section_labels() {
    local element
    local aux
    for element in "${STEPUP_NOTES_SECTIONS[@]}"; do
        element=`echo $element | cut -d'>' -f1`
        aux=STEPUP_NOTES_SECTION_$element
        if [ -z ${!aux} ]; then
            element=$(echo "`sed -e 's/\([a-z]\)/\U\1/' <<< $element`")\:
            eval "export ${aux}=$element"
            debug "export $aux=${!aux}"
        fi
    done
}

if [ -z ${STEPUP_RELEASE_MASK+x} ]; then
    declare STEPUP_RELEASE_MASK="v{major}.{minor}.{patch}.{tiny?}"
    declare -a STEPUP_NOTES_SECTIONS=(features\>minor bugfixes\>patch changes\>patch)
    declare STEPUP_NOTES_SECTION_features="Features:"
    declare STEPUP_NOTES_SECTION_bugfixes="Bugfixes:"
    declare STEPUP_NOTES_SECTION_changes="Changes:"
else
    if [ -z ${STEPUP_NOTES_SECTIONS+x} ]; then
        echo "Notes sections not setted" 1>&2
        exit 1
    fi
fi
declare_section_labels

# STEPUP_PRERELEASE_SEQUENCE=".alpha{alpha} .beta{beta} .rc{rc}"
