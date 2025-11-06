#!/bin/bash
set -euo pipefail

# create directory if it doesn't exist
mkdir -p ../_data/whats_left

# exit violently if the temp file does not exist
if [ ! -f ../_data/whats_left.temp ]; then
    exit 1
fi

# generate the CSV file for builtin items from the temp file
awk -f - ../_data/whats_left.temp > ../_data/whats_left/builtin_items.csv <<'EOF'
BEGIN {
    OFS=","
    print "builtin,name,is_inherited"
}
/^# builtin items/ { in_section=1; next }
/^$/ { if (in_section) exit }
in_section {
    split($1, a, ".")
    rest = ""
    idx = index($0, " ")
    if (idx > 0) {
        rest = substr($0, idx+1)
    }
    print a[1], $1, rest
}
EOF
