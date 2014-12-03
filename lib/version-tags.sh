source $STEPUP_ROOT/default_settings.sh
source $STEPUP_ROOT/_mask.sh
source $STEPUP_ROOT/_tags.sh
source $STEPUP_ROOT/_parse_params.sh
source $STEPUP_ROOT/_support.sh


debug "looking up for tags masked as: $STEPUP_RELEASE_MASK"
debug "Shell regular expression: $(_mask2re)"
_version_tags # TODO: sort the tags
