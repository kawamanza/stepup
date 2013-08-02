_mask2re() {
    local mask=${1:-$STEPUP_RELEASE_MASK}
    local re_mask="^"
    local part=$mask

    while echo $mask | grep '{' 1>/dev/null 2>&1
    do
        part="$(echo $mask | cut -d '{' -f 1)"
        mask=${mask#$part\{}
        re_mask+="\\($part[0-9]\\+\)"
        part=$(echo $mask | cut -d '}' -f 1)
        if echo $part | grep '\?$' 1>/dev/null 2>&1; then
            re_mask+='\?'
        fi
        mask=${mask#$part\}}
        part=$mask
    done
    re_mask+="$part$"

    echo $re_mask | sed 's/\./\\./g'
}
