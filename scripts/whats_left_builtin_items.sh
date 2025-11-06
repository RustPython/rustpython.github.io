#!/bin/bash
set -euo pipefail

# paths where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

DATA_DIR="$PROJECT_ROOT/_data"
TEMP_FILE="$DATA_DIR/whats_left.temp"
OUTPUT_DIR="$DATA_DIR/whats_left"
OUTPUT_FILE="$OUTPUT_DIR/builtin_items.csv"

# create directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# exit violently if the temp file does not exist
if [ ! -f "$TEMP_FILE" ]; then
    echo "error: input file $TEMP_FILE not found" >&2
    exit 1
fi

# generate the CSV file for builtin items from the temp file
awk -f - "$TEMP_FILE" > "$OUTPUT_FILE" <<'EOF'
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
