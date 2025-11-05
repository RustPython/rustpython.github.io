#!/bin/bash

# create directory if it doesn't exist
mkdir -p ../_data/whats_left

# start a new csv file for builtin items
echo "builtin,name,is_inherited" > ../_data/whats_left/builtin_items.csv

# read the temp file
# in awk:
sed -n '/# builtin items/{n;:a;/^$/q;p;n;ba;}' ../_data/whats_left.temp | \
awk -v OFS=',' '{split($1,a,".");if(index($0,FS)>0){b=substr($0,index($0,FS)+1)}else{b=""};print a[1],$1,b}' >> ../_data/whats_left/builtin_items.csv
